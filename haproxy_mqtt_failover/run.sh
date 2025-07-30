#!/bin/bash

echo "🧹 Очистка временных файлов..."
rm -f /tmp/haproxy.cfg

CONFIG="/data/options.json"

if [ ! -f "$CONFIG" ]; then
  echo "❌ Конфигурационный файл $CONFIG не найден."
  exit 1
fi

PORT=$(jq -r '.port' "$CONFIG")
BROKERS=$(jq -r '.brokers[]' "$CONFIG")

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
cat /tmp/haproxy.cfg

echo "🚀 Запуск HAProxy..."
haproxy -f /tmp/haproxy.cfg
