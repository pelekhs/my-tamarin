FROM infsec/tamarin-prover:latest

USER root

RUN apt update && apt install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 tamarin-prover

RUN  echo 'tamarin-prover:tamarin-prover' | chpasswd

#RUN service ssh start

EXPOSE 22

#CMD ["/usr/sbin/sshd","-D"]
 
