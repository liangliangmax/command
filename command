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

删除tag为none的images
docker images |grep none |awk '{print $3}'|xargs docker rmi

docker ps -a // 查看所有容器
$ docker ps -a -q // 查看所有容器ID

$ docker stop $(docker ps -a -q) //  stop停止所有容器
$ docker  rm $(docker ps -a -q) //   remove删除所有容器


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



centoos7 安装rabbitmq
1、wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
2、rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
3、yum install epel-release
4、yum install erlang
5、wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.6/rabbitmq-server-3.6.6-1.el7.noarch.rpm
6、yum install rabbitmq-server-3.6.6-1.el7.noarch.rpm
完成后启动服务：
7、service rabbitmq-server start
可以查看服务状态：
8、service rabbitmq-server status
9、rabbitmq-plugins enable rabbitmq_management
10、curl http://localhost:15672
打开15672端口
11、firewall-cmd --add-port=15672/tcp --permanent
打开5672端口
12、firewall-cmd --add-port=5672/tcp --permanent
13、rabbitmqctl  add_user  luke luke
14、rabbitmqctl  set_user_tags  luke  administrator
15、cd /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.6/plugins
16、wget https://dl.bintray.com/rabbitmq/community-plugins/rabbitmq_delayed_message_exchange-0.0.1.ez
17、rabbitmq-plugins enable rabbitmq_delayed_message_exchange


centos7 关闭防火墙
sudo systemctl stop firewalld.service && sudo systemctl disable firewalld.service


centos7 安装mysql5.7
2、下载 Mysql yum包
wget http://repo.mysql.com/mysql57-community-release-el7-10.noarch.rpm
3、安转软件源
sudo rpm -Uvh mysql57-community-release-el7-10.noarch.rpm
4、安装mysql服务端
yum install -y mysql-community-server
5、启动mysql
service mysqld start
systemctl start mysqld.service
6、检查mysql 的运行状态
service mysqld status
7、修改临时密码
Mysql5.7默认安装之后root是有密码的。
7.1 获取MySQL的临时密码
为了加强安全性，MySQL5.7为root用户随机生成了一个密码，在error log中，关于error log的位置，如果安装的是RPM包，则默认是/var/log/mysqld.log。
只有启动过一次mysql才可以查看临时密码
grep 'temporary password' /var/log/mysqld.log
8.修改密码
set global validate_password_policy=0;
set global validate_password_length=1;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'mypassword' WITH GRANT OPTION;
FLUSH PRIVILEGES;



docker私服搭建
1.抽取最新的仓库镜像
docker pull registry 
2.启动仓库
docker run -d -p 5000:5000 -v /root/registry:/var/lib/registry --name registry --restart=always registry
