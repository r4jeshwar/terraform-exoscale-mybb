data "exoscale_compute_template" "ubuntu" {
  zone = var.zone
  name = var.temp_name
}

resource "exoscale_security_group" "mybb" {
  name        = "mybb-sg"
  description = "MyBB"
}

resource "exoscale_ssh_key" "mybb-key-pair" {
  name       = var.ssh_key_name
  public_key = var.ssh_pub_key
}

resource "exoscale_security_group_rule" "firewall_rules" {
  count             = length("${var.firewall_rules}")
  security_group_id = exoscale_security_group.mybb.id
  type              = "INGRESS"
  protocol          = var.firewall_rules[count.index].protocol
  cidr              = "0.0.0.0/0"
  start_port        = var.firewall_rules[count.index].start_port
  end_port          = var.firewall_rules[count.index].end_port

}

resource "exoscale_compute_instance" "mybb" {
  zone               = var.zone
  name               = var.name
  type               = var.instance_type
  labels             = var.labels
  template_id        = data.exoscale_compute_template.ubuntu.id
  disk_size          = var.disk
  security_group_ids = [exoscale_security_group.mybb.id]
  ssh_key            = exoscale_ssh_key.mybb-key-pair.id

  connection          {
    agent            = false
    type             = "ssh"
    host             = exoscale_compute_instance.mybb.public_ip_address
    private_key      = "${file(var.private_key)}"
    user             = "${var.user}"
  }

  provisioner "remote-exec" {
      inline = [
        "sudo apt update -y",
        "sudo apt install python3.9 -y",
        ]
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 120 && \
      > hosts && \
      echo "[mybb]" | tee -a hosts && \
      echo "${exoscale_compute_instance.mybb.public_ip_address} ansible_user=${var.user} ansible_ssh_private_key_file=${var.private_key}" | tee -a hosts && \
      ansible-playbook -u ${var.user} -i hosts main.yml
    EOT
  }
}