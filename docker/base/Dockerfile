#
# Dockerfile
#

# Pull base image.
FROM dockerfile/ubuntu

#
# Install SSH
#

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:pizza' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Open SSH port
EXPOSE 22

# Add Python packages for configurous scripts
RUN apt-get --assume-yes install python-pip
RUN pip install Jinja2

#
# Base Startup
#

COPY default/startup.sh /usr/bin/startup.sh
COPY default/app.sh /usr/bin/app.sh

RUN chmod 555 /usr/bin/startup.sh
RUN chmod 555 /usr/bin/app.sh

CMD ["/usr/bin/startup.sh"]
