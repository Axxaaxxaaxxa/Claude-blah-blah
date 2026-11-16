ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache wget tar

RUN wget -q https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-linux-static-aarch64.tar.gz \
    && tar -xzf xmrig-6.22.2-linux-static-aarch64.tar.gz \
    && cp xmrig-6.22.2/xmrig /usr/local/bin/ \
    && rm -rf xmrig-6.22.2*

COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
