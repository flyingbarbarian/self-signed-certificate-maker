# self-signed-certificate-maker
オレオレ証明書を発行するスクリプト

## 主な機能
オレオレ証明書をコマンド１つで作成できます。

## 付加的な機能
### オレオレ証明書の発行手順を残せます
発行手順がコード化されているので、どのように証明書を作ったのか忘れずに済みます。

### 設定項目を変更できます
証明書の有効期限、秘密鍵の長さ、鍵の名前は、設定ファイルから簡単に変更できます。

### 証明書の発行履歴を残せます
過去に発行した証明書の簡単な情報がCSVファイルとして出力されます。
この機能はOFFにもできます

## 動作環境
bashとopensslがインストールされていること

## 実行方法
プログラムをダウンロードして、self-signed-certificate-maker.shを実行して下さい。

`bash /yourDownloadDirectory/self-signed-certificate-maker.sh`

## 主な構成ファイルの説明
### self-signed-certificate-maker.sh
このスクリプトの主な処理が書かれたファイルです。

### settings/setting.sh
主な設定項目が書かれたファイルです。
証明書の設定を変えたいときなどはここから数値を変えて下さい。

### results/
生成された証明書や秘密鍵が保存されるディレクトリです。

### histories/history.csv
過去に生成された証明書の情報が記載されたCSVファイルです。
