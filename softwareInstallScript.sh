
**### Bash installatiescript voor Linux Ubuntu 23.10 (64-bits AMD)
  
Dit script installeert de volgende software:

Chrome
Edge
Brave browser
Git
*Enz.* 

  
  
  

    #!/bin/bash
          
        # Function to check if a command is available
    
    command_exists() {
    
    command  -v  "$1"  >/dev/null  2>&1
    
    }
    
      
    
    # Update package index
    
    sudo  apt  update
    
      
    
    # Install Chrome
    
    if  !  command_exists  google-chrome; then
    
    echo  "Installing Google Chrome..."
    
    wget  -q  -O  chrome.deb  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    
    sudo  dpkg  -i  chrome.deb
    
    sudo  apt  install  -f  -y
    
    rm  chrome.deb
    
    echo  "Google Chrome installed."
    
    else
    
    echo  "Google Chrome is already installed."
    
    fi
    
      
    
    # Install Edge
    
    if  !  command_exists  microsoft-edge; then
    
    echo  "Installing Microsoft Edge..."
    
    curl  https://packages.microsoft.com/keys/microsoft.asc  |  gpg  --dearmor  >  microsoft.gpg
    
    sudo  install  -o  root  -g  root  -m  644  microsoft.gpg  /etc/apt/trusted.gpg.d/
    
    sudo  sh  -c  'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge.list'
    
    sudo  rm  microsoft.gpg
    
    sudo  apt  update
    
    sudo  apt  install  microsoft-edge-stable
    
    echo  "Microsoft Edge installed."
    
    else
    
    echo  "Microsoft Edge is already installed."
    
    fi
    
      
    
    # Install Brave Browser
    
    if  !  command_exists  brave-browser; then
    
    echo  "Installing Brave Browser..."
    
    sudo  apt  install  -y  apt-transport-https  curl  gnupg
    
    sudo  curl  -fsSLo  /usr/share/keyrings/brave-browser-archive-keyring.gpg  https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    
    echo  "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"  |  sudo  tee  /etc/apt/sources.list.d/brave-browser.list  >  /dev/null
    
    sudo  apt  update
    
    sudo  apt  install  -y  brave-browser
    
    echo  "Brave Browser installed."
    
    else
    
    echo  "Brave Browser is already installed."
    
    fi
    
      
    
    # Install Git
    
    if  !  command_exists  git; then
    
    echo  "Installing Git..."
    
    sudo  apt  install  -y  git
    
    echo  "Git installed."
    
    else
    
    echo  "Git is already installed."
    
    fi
          
    
    # Install Visual Studio Code (VSCode)
    
    if  !  command_exists  code; then
    
    echo  "Installing Visual Studio Code (VSCode)..."
    
    sudo  apt  install  -y  software-properties-common  apt-transport-https  wget
    
    wget  -q  https://packages.microsoft.com/keys/microsoft.asc  -O-  |  sudo  apt-key  add  -
    
    sudo  add-apt-repository  "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    
    sudo  apt  update
    
    sudo  apt  install  -y  code
    
    echo  "Visual Studio Code (VSCode) installed."
    
    else
    
    echo  "Visual Studio Code (VSCode) is already installed."
    
    fi
       
    
    echo  "All installations complete."

