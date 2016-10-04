FROM centos:centos7.1.1503
MAINTAINER aji

RUN yum -y install wget
RUN yum -y install git
RUN yum -y install unzip

#RUN yum -y install epel-release
#RUN wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
#RUN rpm -ivh ./remi-release-7.rpm
#RUN yum --enablerepo=epel,remi,remi-php70 install php70.x86_64 php70-php-cli.x86_64 php70-php-common.x86_64 php70-php-intl.x86_64 php70-php-json.x86_64 php70-php-mbstring.x86_64 php70-php-mysqlnd.x86_64 php70-php-pdo.x86_64 php70-php-xml.x86_64 php70-runtime.x86_64 





#RUN curl -sS https://getcomposer.org/installer | php
#RUN mv composer.phar /usr/local/bin/composer
