# vm_terraform_azure
This code is written in the Terraform language and creates an Azure infrastructure with various resources, such as a resource group, virtual network, subnets, network interfaces, storage account, and a virtual machine. The resources are created within the specified resource group and location, and are connected to each other as specified in the code. For example, the virtual machine is connected to the specified network interfaces, which are connected to the specified subnets, which are connected to the specified virtual network, which is in the specified resource group.
# to run this code 
terraform init 
terraform plan
terraform apply

