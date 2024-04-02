#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | sudo tee -a ~/.bashrc
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/vscode/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo 'export PATH="/usr/local/bin:$PATH"' | sudo tee -a ~/.bashrc
echo "source ~/.bashrc" | source ~/.bashrc

#Enter zsh
brew install zsh powerlevel10k


#Install dependencies
brew install python pyenv pyenv-virtualenv poetry mysql postgresql  redis

# Install Bun
curl -fsSL https://bun.sh/install | bash
source /home/vscode/.bashrc
source ~/.bashrc



#Install volta
brew install volta

# update bashrc and zshrc
(
echo 'export VOLTA_HOME="$HOME/.volta"'
echo 'export PATH="$VOLTA_HOME/bin:$PATH"'
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
echo 'export BUN_INSTALL="$HOME/.bun"'
echo 'export PATH="$BUN_INSTALL/bin:$PATH"'
) | tee -a ~/.bashrc ~/.zshrc >/dev/null

(
echo 'source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme'
echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true'
) >> ~/.zshrc


source ~/.bashrc
source ~/.zshrc

#Install node
volta install node@18

# End
echo "Dependencies have been installed successfully!"

echo "p10k configure to config zsh theme"
echo "/bin/zsh"
