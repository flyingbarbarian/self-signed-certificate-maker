#!/bin/bash

####################
# 暗号設定
####################
# 公開鍵暗号方式（現在はRSA以外に選べません。）
PUBLIC_KEY_CRYPTOSYSTEM="RSA"

# 秘密鍵の長さ（2048以外の値はテストしていません）
PRIVATE_KEY_NUMBITS=2048

# 秘密鍵の暗号化（現在は暗号化出来ません）
PRIVATE_KEY_ENCRYPTION=""

# 証明書の有効期限
EXPIRATION=3650

####################
# 出力設定
####################
TODAY=`date "+%Y%m%d%k%M%S"`

# 出力先のフォルダ
# git管理対象外のディレクトリを指定しているので、変更する場合は注意して下さい。
RESULTS="./results/${TODAY}/"

# 秘密鍵の名前
PRIVATE_KEY_NAME="${RESULTS}private-key.pem"

# 公開鍵の名前
PUBLIC_KEY_NAME="${RESULTS}public-key.pem"

# 証明書署名要求の名前
CERTIFICATE_SIGNING_REQUEST_NAME="${RESULTS}certificate-signing-request.csr"

# 証明書の名前
CERTIFICATE_NAME="${RESULTS}certificate.crt"

return 0