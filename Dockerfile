FROM cooliobr/mux:1.0

RUN cd /usr/local/src/astra-cooliobr/ && ./configure.sh && make
RUN cd /usr/local/src/astra/ && ./configure.sh && make && make install
VOLUME [ "/tmp", "/run", "/run/lock"]
CMD ["/usr/sbin/init"]
