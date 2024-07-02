# PowerShell script for the first computer

# Variables for IP address, subnet mask, and gateway
$ipAddress = "192.168.1.2"
$subnetMask = "255.255.255.0"
$gateway = "192.168.1.1"

# Function to set static IP address
function Set-StaticIP {
    param (
        [string]$adapterName,
        [string]$ipAddress,
        [string]$subnetMask,
        [string]$gateway
    )

    New-NetIPAddress -InterfaceAlias $adapterName -IPAddress $ipAddress -PrefixLength 24 -DefaultGateway $gateway
    Set-DnsClientServerAddress -InterfaceAlias $adapterName -ServerAddresses ("8.8.8.8","8.8.4.4")
}

# Function to enable network sharing settings
function Enable-NetworkSharing {
    Set-NetConnectionProfile -NetworkCategory Private
    Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True
    Set-NetFirewallRule -DisplayGroup "Network Discovery" -Enabled True

    # Enable public folder sharing
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "AutoShareServer" -Value 1 -PropertyType DWORD -Force
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "AutoShareWks" -Value 1 -PropertyType DWORD -Force

    # Turn off password protected sharing
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "restrictnullsessaccess" -Value 0
}

# Get the Ethernet adapter name
$adapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" -and $_.Name -like "*Ethernet*" } | Select-Object -First 1 -ExpandProperty Name

# Configure static IP address for the first computer
Set-StaticIP -adapterName $adapter -ipAddress $ipAddress -subnetMask $subnetMask -gateway $gateway

# Enable network sharing settings
Enable-NetworkSharing

# Inform the user
Write-Host "Static IP address and network sharing settings have been configured on the first computer."

# Pause the script to allow user to view the message
Read-Host "Press Enter to exit..."
