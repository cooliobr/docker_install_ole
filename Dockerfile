FROM cooliobr/local:1.0
COPY ./conf /opt/conf
RUN chmod -R 777 /opt/conf/
RUN cd /usr/local/src/astra-cooliobr/ && ./configure.sh --with-libdvbcsa && make
RUN cd /usr/local/src/astra/ && ./configure.sh --with-libdvbcsa && make && make install
VOLUME [ "/tmp", "/run", "/run/lock"]
CMD ["/usr/sbin/init"]
