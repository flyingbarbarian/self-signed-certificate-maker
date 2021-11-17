#!/bin/bash

# 設定項目の読み込み
source ./settings/setting.sh

# 出力先のディレクトリを作成する
mkdir $RESULTS

# 秘密鍵の生成
openssl genrsa -out $PRIVATE_KEY_NAME $PRIVATE_KEY_NUMBITS

# 公開鍵の生成
openssl rsa -in $PRIVATE_KEY_NAME -pubout -out $PUBLIC_KEY_NAME

# 自己署名証明書の作成（-batchオプションで質問をスキップ）
openssl req -new -key $PRIVATE_KEY_NAME -out $CERTIFICATE_SIGNING_REQUEST_NAME -batch

# オレオレ証明書の発行
openssl x509 -req -in $CERTIFICATE_SIGNING_REQUEST_NAME -signkey $PRIVATE_KEY_NAME -out $CERTIFICATE_NAME -days $EXPIRATION

exit 0