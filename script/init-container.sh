#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | sudo tee -a ~/.bashrc
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/vscode/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo 'export PATH="/usr/local/bin:$PATH"' | sudo tee -a ~/.bashrc
echo "source ~/.bashrc" | source ~/.bashrc

#Enter zsh
brew install zsh starship zsh-autosuggestions zsh-history-substring-search


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
echo 'eval "$(starship init bash)"'
) >> ~/.bashrc

(
echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
echo 'source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh'
echo 'eval "$(starship init zsh)"'
) >> ~/.zshrc

mkdir -p ~/.config && touch ~/.config/starship.toml
cp /home/teng/script/starship.toml ~/.config/starship.toml

source ~/.bashrc
source ~/.zshrc

#Install node
volta install node@18

bun i -g rimraf pnpm

#Install nerd fonts
brew install fontconfig
mkdir -p ~/.local/share/fonts/NerdFonts
cd ~/.local/share/fonts/NerdFonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaMono.zip

unzip CascadiaCode.zip -d CaskaydiaCove
unzip CascadiaMono.zip -d CascadiaMono

#Install fonts
fc-cache -fv

#Check installed fonts
fc-list | grep -i "CaskaydiaCove"
fc-list | grep -i "CascadiaMono"


# End
echo "Dependencies have been installed successfully!"