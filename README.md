# vm_terraform_azure
This code is written in the Terraform language and creates an Azure infrastructure with various resources, such as a resource group, virtual network, subnets, network interfaces, storage account, and a virtual machine. The resources are created within the specified resource group and location, and are connected to each other as specified in the code. For example, the virtual machine is connected to the specified network interfaces, which are connected to the specified subnets, which are connected to the specified virtual network, which is in the specified resource group.
# to run this code 
terraform init

terraform plan

terraform apply

# after the apply in your azure account should look like this

![23-01-13 16 34 38](https://user-images.githubusercontent.com/86331971/212363778-b2722f32-31fb-4292-99f1-e8575a8b8008.jpg)

