# CCTV2Photo
  萤石视频监控RTSP流转照片脚本，按天生成文件夹

# 使用
  crontab定时任务调用即可
### 拍照： 
`*/5 * * * * /mnt/da/CCTV/photo.sh p`
### 删除： 
`*/5 * * * * /mnt/da/CCTV/photo.sh d`

# 图片转视频
`find -name *.jpg | sort | xargs cat | ffmpeg -f image2pipe -r 30 -vcodec mjpeg -i - -vcodec libx264 out.mp4`
