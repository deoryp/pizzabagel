#
# Dockerfile
#

# Pull base image.
FROM pizza/base

RUN apt-get -y install git libshout3-dev gcc openjdk-7-jdk maven

RUN git clone https://github.com/OlegKunitsyn/libshout-java.git
RUN cd libshout-java; mvn install