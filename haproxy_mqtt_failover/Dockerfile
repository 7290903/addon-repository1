FROM haproxy:2.9

# Установим yq (зависимость для разбора YAML)
RUN apt-get update && \
    apt-get install -y curl jq && \
    curl -L https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -o /usr/bin/yq && \
    chmod +x /usr/bin/yq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh
COPY haproxy.tpl.cfg /haproxy.tpl.cfg

RUN chmod +x /run.sh

USER root

CMD ["/run.sh"]
