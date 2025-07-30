# HAProxy MQTT Failover Add-on for Home Assistant

![HAProxy MQTT Failover](https://github.com/7290903/addon-repository1/tree/main/haproxy_mqtt_failover/icon.png)

## 📦 Описание

Этот Home Assistant Add-on позволяет запустить **HAProxy** внутри Home Assistant OS для организации TCP-фейловера MQTT брокеров.

Основное назначение — обеспечение отказоустойчивости при работе с MQTT (например, `Mosquitto`, `EMQX`, `VerneMQ` и др.).

## 🛠️ Возможности

- Прокси TCP-соединений к нескольким MQTT-брокерам
- Переключение на резервный брокер при недоступности основного
- Простая настройка через UI Home Assistant
- Лёгкий и быстрый запуск

## ⚙️ Конфигурация

Файл `config.json` позволяет задавать параметры прямо из интерфейса:

```json
{
  "port": 1885,
  "brokers": ["192.168.2.10", "192.168.2.11"]
}
```

## 🧾 Пример использования

После запуска прокси-сервис будет доступен на `mqtt://homeassistant:1885`.

В качестве брокеров будут использоваться IP-адреса, указанные в параметре `brokers`.

---

## 📷 Интерфейс Add-on в Home Assistant

Добавьте изображение, показывающее, как выглядит UI аддона. Пример:

![UI Screenshot](https://github.com/7290903/addon-repository1/tree/main/haproxy_mqtt_failover/options.png)


---

## ✅ Совместимость

- ✅ Home Assistant OS 9–16
- ✅ Архитектуры: `aarch64`, `armv7`, `amd64`

---

## 🧠 Автор

Разработано RunHouse для использования в системах умного дома.  
GitHub: (RunHouse([https://github.com/7290903/addon-repository1]))

---

## 📝 Лицензия

MIT License
