# Deploy PyGoat with Terraform

## Alternative way to deploy PyGoat via Terraform:

1. Configure AWS CLI and SSH key.
2. Update `variables.tf` with your `key_name` and `allowed_ip`.
3. Initialize Terraform:
   terraform init
4. Preview changes:
   terraform plan -var 'key_name=your-key-name' -var 'allowed_ip=your-ip/32'
5. Apply deployment:
   terraform apply -var 'key_name=your-key-name' -var 'allowed_ip=your-ip/32'
6. Access PyGoat at the printed URL.
7. Destroy resources when done:
   terraform destroy -var 'key_name=your-key-name' -var 'allowed_ip=your-ip/32'

