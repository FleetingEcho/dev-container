#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | sudo tee -a ~/.bashrc
echo 'export PATH="/usr/local/bin:$PATH"' | sudo tee -a ~/.bashrc
source ~/.bashrc


#Install dependencies
brew install python pyenv pyenv-virtualenv poetry volta mysql postgresql  redis zsh powerlevel10k

# Install Bun
curl -fsSL https://bun.sh/install | bash
source /root/.bashrc

#Install node
volta install node@18

#Enter zsh
/bin/zsh

#Update environment path
(echo 'export VOLTA_HOME="$HOME/.volta"'
echo 'export PATH="$VOLTA_HOME/bin:$PATH"'
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
echo 'source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme'
echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true'
echo 'export BUN_INSTALL="$HOME/.bun"'
echo 'export PATH="$BUN_INSTALL/bin:$PATH"'
) >> ~/.zshrc

source ~/.zshrc

# End
echo "Dependencies have been installed successfully!"

# echo "p10k configure to config zsh theme"
