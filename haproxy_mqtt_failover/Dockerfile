FROM haproxy:2.9

# Копируем скрипты и шаблоны
COPY run.sh /run.sh
COPY haproxy.tpl.cfg /haproxy.tpl.cfg
RUN chmod +x /run.sh

# Переключаемся на root для доступа к конфигу
USER root

CMD ["/run.sh"]
