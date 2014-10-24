FROM ubuntu:14.10
MAINTAINER olof@drp.nu

#RUN debconf-set-selections <<< "postfix postfix/mailname string gitlab.drp.nu"
#RUN debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	build-essential \
	checkinstall \
	cmake \
	curl \
	libcurl4-openssl-dev \
	libexpat1-dev \
	libffi-dev \
	libgdbm-dev \
	libicu-dev \
	libncurses5-dev \
	libpq-dev \
	libreadline-dev \
	libssl-dev \
	libxml2-dev \
	libxslt-dev \
	libyaml-dev \
	libz-dev \
	logrotate \
	gettext \
	nginx \
	openssh-server \
	pkg-config \
	postfix \
	postgresql \
	postgresql-client \
	python-docutils \
	redis-server \
	zlib1g-dev

COPY resources/ /resources/
RUN chmod 755 -R /resources
RUN /resources/install-git
RUN /resources/install-ruby
