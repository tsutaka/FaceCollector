# FaceCollector


## 単体テスト
- PowerShell(or wsl)でFaceCollectorディレクトリ配下で以下コマンドを実行
- `docker build -t facecollector:1.0 .`
- `docker images`
- `docker run -p 49160:80 -d xxxx`
- `docker exec -it xxxx /bin/bash`
- `docker ps`
- `curl -i localhost:49160`