# FaceCollector

## Git clone
- PowerShell(or wsl)
- `cd ~`
- `git clone https://github.com/tsutaka/FaceCollector.git`

## Local test
- 

## Docker test
- PowerShell(or wsl)
- `cd ~/FaceCollector/v0.1/`
- `docker build -t facecollector:1.0 .`
- `docker images`
- `docker run -p 49160:80 -d xxxx`
- `docker ps`
- `docker exec -it xxxx /bin/bash`
- `curl -i localhost:49160`

## AKS環境の作成/削除
- AKS環境の作成削除は下記のスクリプトで実施
  - `/FaceCollector/aztools/createAKS.sh`
    - AKSクラスター環境の作成
  - `/FaceCollector/aztools/deleteAKS.sh`
    - AKSクラスター環境の削除