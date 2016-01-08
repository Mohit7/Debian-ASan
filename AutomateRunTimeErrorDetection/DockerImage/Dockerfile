FROM debian:unstable
MAINTAINER Mohit Bhakkad mohit.bhakkad@gmail.com>

COPY sources.list /etc/apt/
RUN apt-get update

RUN apt-get --yes install gdebi
RUN apt-get update

COPY run_script.sh .

