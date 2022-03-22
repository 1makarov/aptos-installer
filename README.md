# Install
```shell
apt update -y && apt install git -y

git clone https://github.com/1makarov/aptos-installer
chmod +x ./aptos-installer/install.sh && ./aptos-installer/install.sh
```

## Directory:
```shell
cd /home/aptos/
```

## Check Logs:
```shell
docker logs aptos-fullnode-1 --tail 100
```