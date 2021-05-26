#!/bin/bash

# Extracts zsh, zsh-autosuggestions
# and zsh-syntax-highlighting tools
if [[ ! -d pkg/testing/zsh ]]; then
    echo ""
    echo "Extracting..."
    tar -C ./pkg/testing -xzvf ./pkg/testing/zsh-bundle.tar.gz;
    echo "Done."
    echo "--------------------------"
fi

# Pulls linux distro info
. ./pkg/distro.sh

# Checks if zsh is installed
check_zsh_install() {
    command -v "zsh" >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        return true
    else
        return false
    fi
}

# Install zsh if not already installed
while [[ check_zsh_install ]]; do
    echo ""
    echo "Installing ZSH"
    if [[ $OS == "Arch" ]]; then
        sudo pacman -S zsh
    elif [[ $OS == "Kali" ]]; then
        sudo apt install zsh
    elif [[ $OS == "Debian" ]]; then
        sudo apt install zsh
    elif [[ $OS == "Ubuntu" ]]; then
        sudo apt install zsh
    elif [[ $OS == "CentOS" ]]; then
        sudo yum install zsh
    elif [[ $OS == "Red" ]]; then
        sudo yum install zsh
    else
        echo ""
        echo "Unable to detmine package manager."
        echo "Please install ZSH manually."
        echo "Continuing with additional tasks."
        break
    fi

    if [[ check_zsh_install ]]; then
        break
    fi
done

echo ""
echo "Moving resources to /usr/share/zsh*"
if [[ -d /usr/share/zsh/ ]]; then
    echo "placeholder"
    #sudo mv -v /usr/share/zsh{,.bak.$(date +%s)}
    #sudo cp -v ./pkg/zsh /usr/share/zsh
else
    echo "placeholder"
    #sudo cp -v ./pkg/zsh /usr/share/zsh
fi

echo "Current shell: $SHELL"
if [[ -f ~/.zshrc ]]; then
    echo "Backing up ~/.zshrc"
    #mv -v ~/.zshrctest{,.bak.$(date +%s)}
    echo "Creating new ~/.zshrc"
    #cp -v ./pkg/.zshrctest ~/.zshrctest
else
    echo "Creating new ~/.zshrc"
    #cp -v ./pkg/.zshrctest ~/.zshrctest
fi

echo "Complete."
