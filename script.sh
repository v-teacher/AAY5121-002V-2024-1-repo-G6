# Iniciar sesión en Azure (te solicitará tus credenciales)
Connect-AzAccount

# Crear un grupo de recursos
New-AzResourceGroup -Name 'myResourceGroup' -Location 'EastUS'

# Crear una máquina virtual
New-AzVm -ResourceGroupName 'myResourceGroup' `
         -Name 'myVM' `
         -Location 'eastus' `
         -Image 'MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest' `
         -VirtualNetworkName 'myVnet' `
         -SubnetName 'mySubnet' `
         -SecurityGroupName 'myNetworkSecurityGroup' `
         -PublicIpAddressName 'myPublicIpAddress' `
         -OpenPorts 80,3389 `
         -Size 'Standard_D2s_v3'

#Instalar servidor web
Invoke-AzVMRunCommand -ResourceGroupName 'myResourceGroup' -VMName 'myVM' -CommandId 'RunPowerShellScript' -ScriptString 'Install-WindowsFeature -Name Web-Server -IncludeManagementTools'
