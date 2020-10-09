#!/usr/bin/env bash
# https://qiita.com/yota-p/items/affe6d970ac4896d6e70
# https://qiita.com/lain21/items/a33a39d465cd08b662f1

######### docker imageを作る(1回目)
cd ~/
git clone https://github.com/Kaggle/docker-python.git
cd docker-python

# --gpuオプションでビルド
# ./build --gpu

# cpuでビルド
./build


# GCRに登録 
gcp_project_id=$(gcloud config list | grep project | awk '{print $3;}')
gcloud auth configure-docker # dockerをgcloudを介さず使うため、[Y/n]を聞かれるのでYを選択
docker tag kaggle_base gcr.io/$gcp_project_id/kaggle_base
docker push gcr.io/$gcp_project_id/kaggle_base

######## docker imageをとってくる(2回目以降)
# docker pull gcr.io/{{ GCPID }}/kaggle_base

# Update pip
pip install --upgrade pip

# Kaggle-API
pip install kaggle

# gpu使う時
export LD_LIBRARY_PATH=/usr/local/cuda/lib64

# タイムゾーンの変更
rm /etc/localtime # シンボリックリンクを削除
echo Asia/Tokyo > /etc/timezone # timezone上書き
dpkg-reconfigure -f noninteractive tzdata # シンボリックリンク再作成


# dataとってくる
cd ~/moa
kaggle competitions download -c lish-moa -p moa/data
unzip {{ zip_data }} -d moa/data
chmod -w easy_gold/data/*
