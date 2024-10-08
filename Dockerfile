FROM cooliobr/mux:isdbt
COPY ./conf /opt/conf
RUN chmod -R 777 /opt/conf/
RUN cd /usr/local/src/astra-cooliobr/ && ./configure.sh && make
RUN cd /usr/local/src/astra/ && ./configure.sh && make && make install
VOLUME [ "/tmp", "/run", "/run/lock"]
CMD ["/usr/sbin/init"]
