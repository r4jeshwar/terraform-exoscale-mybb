# terraform-exoscale-mybb

This deploy the mybb application on Exoscale instance using the Terraform(Infrastructure) and Ansible(Configuration)

# How to run application
Clone the repo

```
git clone https://github.com/r4jeshwar/terraform-exoscale-mybb.git
```
# Submodule update

Put the below command after cloning the repository for update the git submodule to get the content from submodule repositoy

```
cd terraform-exoscale-mybb
git submodule update --init
```

# Create the playbook for task running

Create the `main.yml` ansible playbook for access the ansible-roles to application running.
```
#main.yml

- hosts: all
  become: true
  roles:
    - <path_to_ansible-role-mybb>
```

# Provide a path of playbook

Enter into the exoscale-mybb-deploy directory

```
cd exoscale-mybb-deploy
```
Edit the `main.tf` template to add the path of ansible playbook.yml
```
provisioner "local-exec" {
    command = <<EOT
      sleep 120 && \
      > hosts && \
      echo "[mybb]" | tee -a hosts && \
      echo "${exoscale_compute_instance.mybb.public_ip_address} ansible_user=${var.user} ansible_ssh_private_key_file=${var.private_key}" | tee -a hosts && \
      ansible-playbook -u ${var.user} -i hosts <path_to_playbook's_main.yml>
    EOT
  }
}
```
# Run the Terraform template

```
terraform init
terraform plan 
terraform apply
```
# Contributing
Don’t hesitate to create a pull request