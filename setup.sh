#!/bin/bash

#############################################
# 使用方法
#
# 1. セットアップ用リポジトリをcloneする
# 2. SourceTreeのターミナル、またはGit Bashを開く
# 3. sh setup.sh と入力してこのファイルを実行する
# 4. いい感じにセットアップが終わる
#
#############################################
# 編集が必要な環境変数

# clone元のユーザ
# NOTE: 自分のリポジトリにforkしている場合はここを自分のユーザ名に書き換えてください
GITHUB_USER="vtn-team"
API_SERVER_PROJECT="SocialGameNodeJSServer"
GAME_SERVER_PROJECT="GameServerSample"

##############################################


# ここから先は編集しなくていい
BASE_DIR="$(cd $(dirname $0); pwd)"

# APIサーバのclone
mkdir apiServer
cd apiServer
git clone https://github.com/${GITHUB_USER}/${API_SERVER_PROJECT} ./
cd ${BASE_DIR}
cp docker/api_server/Dockerfile apiServer/Dockerfile

# ゲームサーバのclone
cd ${BASE_DIR}
mkdir gameServer
cd gameServer
git clone https://github.com/${GITHUB_USER}/${GAME_SERVER_PROJECT} ./
cd ${BASE_DIR}
cp docker/game_server/Dockerfile apiServer/Dockerfile

# 環境構築のみ
cd ${BASE_DIR}
docker-compose create