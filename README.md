# FaceCollector


## 単体テスト
- PowerShell(or wsl)でFaceCollectorディレクトリ配下で以下コマンドを実行
- `docker build -t facecollector:1.0 .`
- `docker images`
- `docker run -p 49160:80 -d xxxx`
- `docker exec -it xxxx /bin/bash`
- `docker ps`
- `curl -i localhost:49160`

## AKS環境の作成/削除
- AKS環境の作成削除は下記のスクリプトで実施
  - aztools/createAKS.sh
    - AKSクラスター環境の作成
  - aztools/deleteAKS.sh
    - AKSクラスター環境の削除