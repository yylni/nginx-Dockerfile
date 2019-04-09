FROM centos
RUN yum -y install gcc gcc-c++ zlib-devel pcre-devel make
ADD http://59.80.44.46/nginx.org/download/nginx-1.14.2.tar.gz /usr/local/src/
WORKDIR /usr/local/src/
RUN tar xzvf nginx-1.14.2.tar.gz
RUN cd nginx-1.14.2 && ./configure --prefix=/usr/local/nginx && make && make install
RUN ln /usr/local/nginx/sbin/nginx /usr/bin/
RUN sed -i "2a\daemon off;" /usr/local/nginx/conf/nginx.conf
CMD ["/usr/local/nginx/sbin/nginx"]
EXPOSE 80
