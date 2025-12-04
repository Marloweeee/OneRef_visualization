#!/bin/bash

# 设置 Hugging Face 镜像站点（使用国内镜像加速下载）
export HF_ENDPOINT=https://hf-mirror.com

# 仓库信息
REPO_ID="linhuixiao/OneRef"
FILE_NAME="rec_single_dataset_finetuning_base.zip"

# 下载目录（可以根据需要修改）
LOCAL_DIR="./weights"

echo "开始下载模型权重: ${FILE_NAME}"
echo "从仓库: ${REPO_ID}"
echo "保存到: ${LOCAL_DIR}"

# 创建下载目录
mkdir -p ${LOCAL_DIR}

# 使用 huggingface-cli 下载指定文件
huggingface-cli download ${REPO_ID} ${FILE_NAME} --local-dir ${LOCAL_DIR}

# 检查下载是否成功
if [ $? -eq 0 ]; then
    echo "下载完成！"
    echo "文件保存在: ${LOCAL_DIR}/${FILE_NAME}"
else
    echo "下载失败，请检查网络连接或登录状态"
    exit 1
fi

