FROM devops.nxp.com/face-recognition-server-x86:2018-4-18

#RUN echo "Asia/Shanghai" > /etc/timezone;dpkg-reconfigure -f noninteractive tzdata

RUN mkdir -p /app

ENV http_proxy="http://wbi\nxf42681:Welcome%402017@apac.nics.nxp.com:8080" 
ENV ftp_proxy="http://wbi\nxf42681:Welcome%402017@apac.nics.nxp.com:8080" 
ENV https_proxy="http://wbi\nxf42681:Welcome%402017@apac.nics.nxp.com:8080"
WORKDIR /app

RUN apt-get install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu 
RUN apt-get update

RUN git clone https://github.com/tensorflow/tensorflow
WORKDIR tensorflow
RUN ./tensorflow/contrib/lite/tools/make/download_dependencies.sh
ADD build_rpi_lib.sh ./tensorflow/contrib/lite/tools/make/build_rpi_lib.sh
ADD Makefile ./tensorflow/contrib/lite/tools/make/Makefile
RUN ./tensorflow/contrib/lite/tools/make/build_rpi_lib.sh
WORKDIR ./tensorflow/contrib/lite/tools/make/gen/aarch64-arm/lib/
