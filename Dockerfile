# Base image
FROM centos:latest
MAINTAINER kentaro a
ENV PATH $PATH:/usr/local/bin

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
RUN yum -y install --enablerepo=epel,remi,remi-php70 php70.x86_64 php70-php-cli.x86_64 php70-php-common.x86_64 php70-php-intl.x86_64 php70-php-json.x86_64 php70-php-mbstring.x86_64 php70-php-mysqlnd.x86_64 php70-php-pdo.x86_64 php70-php-xml.x86_64 php70-runtime.x86_64 php70-php-mcrypt.x86_64 libmcrypt.x86_64 php70-php-opcache.x86_64 php70-php-pecl-apcu.x86_64
RUN cat /opt/remi/php70/enable >> ~/.bashrc
RUN source ~/.bashrc
RUN ln -fs /etc/opt/remi/php70/php.ini /etc/php.ini
RUN cp /docker/php.ini /etc/opt/remi/php70/

# vim
RUN yum -y install vim
RUN git clone https://github.com/kentaro-a/vimrc.git /root/.vim
RUN sh /root/.vim/nb-install.sh
RUN cp /root/.vim/.vimrc /root/

