FROM centos

COPY ./kube.repo /yum.repos.d/
RUN yum install openssh-server -y
RUN yum install java -y
RUN yum install kubectl -y
RUN yum install git -y
RUN yum install sudo -y
COPY ca.crt /root/
COPY client.crt /root/
COPY client.ket /root/
COPY config /root/.kube/
RUN ssh-keygen -A
CMD ["/usr/sbin/sshd", "-D"] && /bin/bash

