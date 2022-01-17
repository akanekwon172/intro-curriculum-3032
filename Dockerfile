FROM --platform=linux/x86_64 node:14.17.6

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

RUN apt-get update \
&& apt-get install --no-install-recommends -y locales tmux vim \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN locale-gen ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP
RUN yarn global add htpasswd@2.4.4
ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo
WORKDIR /app
