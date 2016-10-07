# Base image
FROM centos:latest
MAINTAINER kentaro a
ENV PATH $PATH:/usr/local/bin

RUN yum -y update

# Install required modules
RUN yum -y install git
RUN yum -y install wget
RUN yum -y install tar

# repository
RUN yum -y install epel-release
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# Clone configs
RUN git clone https://github.com/kentaro-a/docker.git

# apache
RUN yum -y install httpd
RUN cp -f /docker/httpd.conf /etc/httpd/conf/
#EXPOSE 80
#ENTRYPOINT /usr/sbin/httpd -D FOREGROUND

# php70
RUN yum --enablerepo=remi-php70 -y install php php-cli php-devel php-common php-mbstring php-mysql php-phpunit-PHPUnit php-pecl-xdebug php-fpm php-gd php-gmp php-mcrypt php-opcache php-pdo php-xml php-intl
#RUN cat /opt/remi/php70/enable >> ~/.bashrc
#RUN source ~/.bashrc
#RUN ln -fs /etc/opt/remi/php70/php.ini /etc/php.ini
RUN cp -rf /docker/php.ini /etc/php.ini

# vim
RUN yum -y install vim
RUN git clone https://github.com/kentaro-a/vimrc.git /root/.vim
RUN sh /root/.vim/nb-install.sh
RUN cp /root/.vim/.vimrc /root/

