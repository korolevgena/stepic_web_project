#!/usr/bin/python
import os

print os.environ.get("QUERY_STRING", "No Query String in url")

"\r\n".join(environ['QUERY_STRING'].split("&")) 


Проверка конфига sudo nginx -c /etc/nginx/site-enable/test.conf -t  
Для запуска процесса в фоне используют & на конце комманды, пример: gunicorn -b 0.0.0.0:8080 -c hello &