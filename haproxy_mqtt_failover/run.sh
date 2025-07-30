#!/bin/bash

set -e

echo "🧹 Очистка временных файлов..."
rm -f /tmp/haproxy.cfg

CONFIG="/config/haproxy_mqtt.yaml"

if [ ! -f "$CONFIG" ]; then
  echo "❌ Конфигурационный файл $CONFIG не найден."
  exit 1
fi

PORT=$(yq e '.port' "$CONFIG")
BROKERS=$(yq e '.brokers[]' "$CONFIG")

echo "🔧 Генерация haproxy.cfg на порт $PORT с брокерами:"
for b in $BROKERS; do echo " - $b"; done

BROKER_SERVERS=""
i=1
for b in $BROKERS; do
  BROKER_SERVERS+="    server broker_$i $b:1883 check fall 3 rise 2"$'\n'
  ((i++))
done

export PORT
export BROKER_SERVERS

envsubst < /haproxy.tpl.cfg > /tmp/haproxy.cfg

echo "📄 Сгенерированная конфигурация:"
cat /tmp/haproxy.cfg

echo "🚀 Запуск HAProxy с конфигом /tmp/haproxy.cfg..."
exec haproxy -f /tmp/haproxy.cfg
