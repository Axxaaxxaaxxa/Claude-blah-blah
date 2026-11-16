ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache cmake make g++ git \
    libuv-dev openssl-dev hwloc-dev

RUN git clone --depth 1 https://github.com/xmrig/xmrig.git /tmp/xmrig \
    && mkdir /tmp/xmrig/build \
    && cd /tmp/xmrig/build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && make -j4 \
    && cp xmrig /usr/local/bin/ \
    && rm -rf /tmp/xmrig

COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
