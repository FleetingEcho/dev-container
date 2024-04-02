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

docker ps  # get container ID
docker exec -it c05bd90de191 bash # Replace the container ID
cd /workspaces/HOME_DIR  #my macbook folder /Ubuntu

exit # exit the remote terminal
