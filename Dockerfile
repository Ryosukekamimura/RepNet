FROM python:3.8.0
USER root

RUN apt-get update
RUN apt-get upgrade -y
# imageのサイズを小さくするためにキャッシュを削除
RUN apt-get clean
RUN rm -rf /var/lib/apt/list/*
# pip のアップデート
RUN pip install --upgrade pip
# open cvに必要なパッケージをインストール
RUN apt-get install -y vim
RUN apt-get install -y libgl1-mesa-dev

# 作業ディレクトリを変更
WORKDIR /home/RepNet

COPY requirements.txt ${PWD}

# python のパッケージをインストール
RUN pip install -r requirements.txt

# 作業ディレクトリを変更
WORKDIR /home/RepNet/src

