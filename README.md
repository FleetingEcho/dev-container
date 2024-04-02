### Update devcontainer.json
### DEV CONTAINERS: OPEN CONTAINER CONFIGURATION FILE
```json
{
	"name": "Ubuntu",
	"runArgs": ["--platform=linux/amd64"],
	"image": "mcr.microsoft.com/devcontainers/base:jammy",
	"mounts": [
		"source=/Users/tengzhang/Documents/Core/HOME_DIR/,target=/home/teng,type=bind",
		"source=/Users/tengzhang/Documents/Core/HOME_DIR/script,target=/home/teng/script,type=bind"
	],
  "remoteUser": "root",
  "postCreateCommand": "/home/teng/script/init-container.sh",
  "forwardPorts": [3000,3001,3002,3003,3004,3005, 5000,8000,8080,9000,5432,3306,27017,6379]
}
```

### Use terminal to connect to this dev-container

```bash
docker ps  # get container ID

docker exec -it c05bd90de191 bash # Replace the container ID

cd /workspaces/HOME_DIR  #my macbook folder /Ubuntu

exit # exit the remote terminal
```


### init.container.sh

```bash
#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /root/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


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

echo "p10k configure to config zsh theme"

```