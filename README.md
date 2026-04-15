### QUICK START

1. Install Azure CLI and Terraform.
2. Run: az login
3. Generate an RSA SSH key pair for Azure:
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/azure_vm_rsa
4. cp terraform.tfvars.example terraform.tfvars
4. Copy the public key into terraform.tfvars:
   cat ~/.ssh/azure_vm_rsa.pub
5. Copy terraform.tfvars.example to terraform.tfvars
6. Edit terraform.tfvars with your real values.
7. Run:
   scripts/migrate.sh <db name>

### IMPORTANT

- Azure Linux VM provisioning in this configuration requires an RSA public key.
- Do NOT use an ssh-ed25519 public key in terraform.tfvars for ssh_public_key.
- This project creates the Azure VM for you.

