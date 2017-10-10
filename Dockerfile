FROM jenkins/jenkins
ENV STF_AUTH f82bcdc614e54f4f941087adf7d20d55af4dabc1e50c42da8f06ce9928d6a4f7
USER root
RUN apt-get update
RUN apt-get install -y git curl apache2 python2.7 python-pip
RUN yes|apt-get install software-properties-common
RUN apt-get update
RUN yes|apt-get upgrade --allow-unauthenticated


RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update --allow-unauthenticated && \
  apt-get install -y oracle-java8-installer --allow-unauthenticated && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle



USER jenkins
