#通过scp上传文件
scp /home/liang/Downloads/node-v8.6.0.tar.gz  root@42.202.130.7:/root/liang/node

#通过scp下载文件
scp username@servername:/path/filename /var/www/local_dir（本地目录）

#ssh登录
ssh root@42.202.130.7


#数据库导出数据库
mysqldump -h 10.4.115.69 -u root -p password --default-character-set=utf8 rp2 > d://rp.sql

#数据库导入
source d://rp.sql

#docker操作
docker build -t zingdocker/jdk-tomcat .
docker run -d -p 8090:8080 zingdocker/jdk-tomcat

#git操作
#拉取远程的分支代码
git pull origin max-translia/webpurify

#切换分支
git checkout max-translia/webpurify

linux
centos minimal 开启网络: nmtui

centos minimal 安装桌面: yum -y groups install "GNOME Desktop"

centos minimal 进入图形桌面: startx

centos minimal 退出图形界面: ctrl+alt+F2

linux 命令行加载网卡驱动

查看是否安装网卡驱动打开终端，输入ifconfig –a

启动网卡 ifconfig eth0 up 

自动获取ip dhclient eth0

手动获取ip 
