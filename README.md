# Windows-LAN-Setup-Scripts
PowerShell scripts for setting up direct Ethernet connection between Windows computers, enabling file sharing without Wi-Fi or internet.


# Windows Ethernet Connection Scripts

This repository contains PowerShell scripts and setup instructions for establishing a direct network connection between two Windows computers using an Ethernet cable. The scripts automate the process of assigning static IP addresses and enabling file sharing, facilitating seamless data transfer without the need for a Wi-Fi router or internet connection.

## Features

- **Automated Setup:** PowerShell scripts automate the configuration of network settings.
- **File Sharing:** Enable sharing between computers over LAN for seamless file transfer.
- **No Router Required:** Establish connection directly using an Ethernet cable.

## Requirements

- Windows operating system (tested on Windows 10 and Windows Server).
- Administrator privileges to run PowerShell scripts.
- An Ethernet cable.

## Setup Instructions

### Step 1: Connect the Computers

1. **Connect the Ethernet Cable:**
   - Plug one end of the Ethernet cable into the Ethernet port of the first computer.
   - Plug the other end of the Ethernet cable into the Ethernet port of the second computer.

### Step 2: Download the Scripts

1. **Download the Scripts from the Repository:**
   - Download or clone this repository to both computers.

### Step 3: Run the Scripts

**On the First Computer:**

1. **Open PowerShell as Administrator:**
   - Click on the Start menu.
   - Type `PowerShell`.
   - Right-click on `Windows PowerShell` and select `Run as administrator`.

2. **Navigate to the Downloads Folder (or the folder where you saved the script):**
   ```powershell
   cd $HOME\Downloads
   .\Computer1.ps1

  ## On the Second Computer:

  Open PowerShell as Administrator:
  - Click on the Start menu.
  - Type PowerShell.
  - Right-click on Windows PowerShell and select Run as administrator.

  ## Navigate to the Downloads Folder (or the folder where you saved the script):
  - powershell
  `cd $HOME\Downloads`
  - Run the Script: `.\Computer2.ps1`

### Step 4: Verify the Connection
  - Check IP Configuration:
      Open Command Prompt on each computer.
      Run ipconfig and ensure the IP addresses are correctly assigned:
            First computer: 192.168.1.2
            Second computer: 192.168.1.3

  - Ping Each Computer:
    On the first computer, ping the second computer:
        `ping 192.168.1.3`

    On the second computer, ping the first computer:
        `ping 192.168.1.2`
    You should receive replies, indicating the connection is established.


### Step 5: Share Files

On the First Computer:

    Create and Share a Folder:
        Create a folder named SharedFolder on your desktop.
        Right-click on SharedFolder, select Give access to > Specific people.
        Select Everyone from the drop-down menu and click Add.
        Set permissions to Read/Write and click Share.
        Note the network path (e.g., \\192.168.1.2\SharedFolder).

On the Second Computer:

    Access the Shared Folder:
        Open File Explorer.
        Type the network path (e.g., \\192.168.1.2\SharedFolder) in the address bar and press Enter.
        Access and transfer files to and from this folder.


### (Optional) Stop Sharing the Folder

On the First Computer:

    Stop Sharing:
        Right-click on the shared folder (SharedFolder).
        Select Give access to > Remove access.
        Click on Stop sharing.
