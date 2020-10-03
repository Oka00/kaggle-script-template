#!/usr/bin/env bash

# 参考 pytorch + cpu
# https://cloud.google.com/ai-platform/deep-learning-vm/docs/pytorch_start_instance?hl=ja


export IMAGE_FAMILY="pytorch-latest-cpu" # pytorch or tensorflow
export ZONE="asia-northeast1-c" # 東京
export INSTANCE_NAME="kaggle-x" 
export BOOT_DISK_SIZE="200GB" # 200gb下回るとパフォーマンス落ちるとwarningが出る
export INSTANCE_TYPE="n1-highmem-2"

gcloud compute instances create $INSTANCE_NAME \
  --zone=$ZONE \
  --image-family=$IMAGE_FAMILY \
  --image-project=$INSTANCE_NAME \
  --boot-disk-size=$BOOT_DISK_SIZE\
  --machine-type=$INSTANCE_TYPE \
  --image-project=deeplearning-platform-release \
  --preemptible
