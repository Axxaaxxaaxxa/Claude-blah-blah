ARG BUILD_FROM

# Stage 1: Kompilieren
FROM alpine:3.19 AS builder

RUN apk add --no-cache cmake make g++ git libuv-dev openssl-dev linux-headers musl-dev

RUN git clone --depth 1 https://github.com/xmrig/xmrig.git /xmrig \
    && mkdir /xmrig/build \
    && cd /xmrig/build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release -DWITH_HWLOC=OFF \
    && make -j2

# Stage 2: Finales Image
FROM $BUILD_FROM

RUN apk add --no-cache libuv libstdc++ libgcc

COPY --from=builder /xmrig/build/xmrig /usr/local/bin/xmrig
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
