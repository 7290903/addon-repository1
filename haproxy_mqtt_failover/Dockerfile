FROM haproxy:2.9

# Переключаемся на root для установки зависимостей
USER root

# Установим yq (через скачивание) и зависимости
RUN apt-get update && \
    apt-get install -y curl jq && \
    curl -L https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -o /usr/bin/yq && \
    chmod +x /usr/bin/yq && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Копируем скрипт и шаблон
COPY run.sh /run.sh
COPY haproxy.tpl.cfg /haproxy.tpl.cfg
RUN chmod +x /run.sh

# Запускаем как root (или можно USER haproxy, если необходимо ограничение)
CMD ["/run.sh"]
