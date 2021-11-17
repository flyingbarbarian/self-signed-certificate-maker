#!/bin/bash

####################
# 設定の読み込みなど
####################
# 設定項目の読み込み
source ./settings/setting.sh

# 出力先のディレクトリを作成する
mkdir $RESULTS


####################
# 証明書の発行など
####################
# 秘密鍵の生成
openssl genrsa -out $PRIVATE_KEY_NAME $PRIVATE_KEY_NUMBITS

# 公開鍵の生成
openssl rsa -in $PRIVATE_KEY_NAME -pubout -out $PUBLIC_KEY_NAME

# 自己署名証明書の作成（-batchオプションで質問をスキップ）
openssl req -new -key $PRIVATE_KEY_NAME -out $CERTIFICATE_SIGNING_REQUEST_NAME -batch

# オレオレ証明書の発行
openssl x509 -req -in $CERTIFICATE_SIGNING_REQUEST_NAME -signkey $PRIVATE_KEY_NAME -out $CERTIFICATE_NAME -days $EXPIRATION


####################
# 履歴の作成など
####################
# 履歴を使わない場合はここで終了
if [ $HISROY_USE -eq 0 ]
then
    exit 0
fi

# history.csvが存在しない場合は、ファイルを作成してヘッダ行を追加する。
if [ ! -f $HISTORY ]
then
    echo "発行時刻, 公開鍵暗号方式, 秘密鍵の長さ, 秘密鍵の暗号化, 証明書有効期限, 秘密鍵名, 公開鍵名, CSR名, 証明書名" > $HISTORY
fi

# 履歴の作成
echo "${TODAY}, ${PUBLIC_KEY_CRYPTOSYSTEM}, ${PRIVATE_KEY_NUMBITS}, ${PRIVATE_KEY_ENCRYPTION}, ${EXPIRATION}, ${PRIVATE_KEY_NAME}, ${PUBLIC_KEY_NAME}, ${CERTIFICATE_SIGNING_REQUEST_NAME}, ${CERTIFICATE_NAME}" >> $HISTORY

exit 0