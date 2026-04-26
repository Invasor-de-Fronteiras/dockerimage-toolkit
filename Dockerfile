FROM alpine:3.21

RUN apk add --no-cache \
    curl \
    bash \
    python3 \
    py3-pip \
    postgresql-client \
    ca-certificates \
    && pip3 install --no-cache-dir --break-system-packages awscli \
    && KUBECTL_VERSION=$(curl -s https://dl.k8s.io/release/stable.txt) \
    && curl -Lo /usr/local/bin/kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x /usr/local/bin/kubectl

CMD ["bash"]
