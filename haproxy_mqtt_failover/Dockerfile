# Используем официальный образ HAProxy
FROM haproxy:2.9

# Переключаемся на root
USER root

# Устанавливаем зависимости и yq для текущей архитектуры
RUN set -ex && \
    apt-get update && \
    apt-get install -y curl jq ca-certificates && \
    ARCH="$(uname -m)" && \
    case "$ARCH" in \
      aarch64)  YQ_BIN="yq_linux_arm64" ;; \
      armv7l)   YQ_BIN="yq_linux_arm" ;; \
      x86_64)   YQ_BIN="yq_linux_amd64" ;; \
      *) echo "❌ Unsupported architecture: $ARCH" && exit 1 ;; \
    esac && \
    curl -L "https://github.com/mikefarah/yq/releases/latest/download/${YQ_BIN}" -o /usr/bin/yq && \
    chmod +x /usr/bin/yq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Копируем скрипты и шаблоны
COPY run.sh /run.sh
COPY haproxy.tpl.cfg /haproxy.tpl.cfg

# Разрешаем запуск
RUN chmod +x /run.sh

# Запуск скрипта при старте
CMD ["/run.sh"]
