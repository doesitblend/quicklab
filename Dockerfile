# -*- mode: Dockerfile -*-
FROM centos/systemd
ARG saltversion
ARG masterip
RUN yum install -y git python wget curl virt-what net-tools iproute locales deltarpm  && yum clean all
RUN wget -O /root/install_salt.sh https://bootstrap.saltstack.com/  
RUN chmod a+x /root/install_salt.sh
RUN sh /root/install_salt.sh -X -M -P stable ${saltversion} && yum clean all
RUN mkdir /srv/raas /srv/salt /srv/pillar /srv/reactor
RUN systemctl disable salt-master salt-minion
RUN yum install -y jq python2-pip gcc python-devel
RUN yum clean all
RUN pip install setproctitle
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_CTYPE=en_US.utf8

CMD ["/usr/sbin/init"]
