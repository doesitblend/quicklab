FROM centos:6.9

ARG saltversion

RUN yum install -y git python wget curl virt-what net-tools iproute locales deltarpm jq
RUN yum clean all
RUN wget -O /root/install_salt.sh https://bootstrap.saltstack.com/  
RUN chmod a+x /root/install_salt.sh
RUN sh /root/install_salt.sh -X -M -P stable ${saltversion} && rm -fv /root/install_salt.sh
RUN mkdir /srv/raas /srv/salt /srv/pillar /srv/reactor
#RUN systemctl disable salt-master salt-minion
RUN yum install -y python2-pip python-pip  

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_CTYPE=en_US.utf8
COPY --chown=root:root ./locale.conf /etc/locale.conf

EXPOSE 4505
EXPOSE 4506

CMD ["/usr/sbin/init"]
