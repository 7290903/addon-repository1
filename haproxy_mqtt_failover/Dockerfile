FROM haproxy:2.9

COPY run.sh /run.sh
COPY haproxy.tpl.cfg /haproxy.tpl.cfg

# Обязательно убедитесь, что файл уже исполняемый!
# chmod здесь не нужен, иначе будет ошибка

ENTRYPOINT ["/run.sh"]

