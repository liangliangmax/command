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

centos7下网卡不能启动，报network.service - LSB: Bring up/down networking
试一下：
systemctl stop NetworkManager
systemctl disable NetworkManager
Removed symlink /etc/systemd/system/multi-user.target.wants/NetworkManager.service.
Removed symlink /etc/systemd/system/dbus-org.freedesktop.NetworkManager.service.
Removed symlink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service.
重新启动网络：
systemctl start network.service
ifconfig |grep eno


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

如果提示failed start rabbitmq
/var/lib/rabbitmq/mnesia 目录下存在rabbit@localhost.pid、rabbit@localhost、rabbit@localhost-plugins-expand，删除这3项后，再使用systemctl start rabbitmq-server启动，发现不报错了。

centos7 关闭防火墙
sudo systemctl stop firewalld.service && sudo systemctl disable firewalld.service


docker 运行rabbitmq
docker pull rabbitmq:management

docker run -d --name rabbitmq --publish 5671:5671 \ --publish 5672:5672 --publish 4369:4369 --publish 25672:25672 --publish 15671:15671 --publish 15672:15672 \rabbitmq:management

容器启动之后就可以访问web 管理端了
http://宿主机IP:15672，默认创建了一个 
guest 用户，密码也是 guest。

-----------------------------------------------
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
3.查看仓库中的镜像名称
curl -XGET http://192.168.1.8:5000/v2/_catalog
4.查看仓库某个镜像的所有版本号
curl -XGET http://192.168.1.8:5000/v2/nginx/tags/list
5.如果提示要安全连接，修改/etc/docker/daemon.json文件
#vi /etc/docker/daemon.json
{
    "insecure-registries": ["192.168.226.138:5000"] 
}
#systemctl daemon-reload 
#systemctl restart docker
6.提交本地镜像
docker tag inits/nginx1.8 192.168.226.138:5000/nginx1.8:latest
docker push 192.168.226.138:5000/nginx1.8:latest



ubuntu下用户提升到root权限
1.打开超级终端，输入指令sudo gedit /etc/passwd ，回车
2.找到我们用户名所在的那一行，将里面的当前用户的ID值进行修改。譬如我的当前用户是crystal。
则找到了   crystal:x:1000:1000:crystal:/home/linuxidc:/bin/bash   将两个1000改成0即可。
3.即最后改完的结果为：
crystal:x:0:0:crystal:/home/linuxidc:/bin/bash  
4.最后将Ubuntu系统进行注销，然后在登陆的用户名里输入 你自己的用户名和密码，这样登陆上来就是root权限了。这是因为root的ID值为0。
