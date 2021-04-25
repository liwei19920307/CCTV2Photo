#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# 路径
PHOTO_PATH=/mnt/da/CCTV/flower

# 当前时间
TIME=$(date +%Y%m%d%H%M%S)

# 当前日期
DATE=$(date +%Y%m%d)

# 保留天数
DAY=365

# 拍照
function photo() {

  # 创建拍照路径
  if [ ! -e $PHOTO_PATH/$DATE ] && [ ! -d $PHOTO_PATH/$DATE ]; then
    mkdir -p $PHOTO_PATH/$DATE
    echo "创建拍照文件夹: $PHOTO_PATH/$DATE"
  fi

  ffmpeg -i 'rtsp://admin:萤石密钥@192.168.2.100:554/h264/ch1/main/av_stream' -f image2 -vframes 1 -pix_fmt yuvj420p $PHOTO_PATH/$DATE/$TIME.jpg

}

# 删除
function del() {

  find $PHOTO_PATH -type d -mtime +$DAY -exec rm -rf {} \;

}

case $1 in
p)
  echo "拍照开始"
  photo
  echo "拍照结束"
  ;;
d)
  echo "删除开始"
  del
  echo "删除结束"
  ;;
?)
  echo "未知参数"
  exit 1
  ;;
esac
