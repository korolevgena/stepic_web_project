mkdir public/img -p
mkdir public/js -p
mkdir public/css -p
mkdir uploads

sudo apt-get update 
sudo apt-get install nginx
sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo rm /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/gunicorn.conf   /etc/gunicorn.d/test
sudo ln -sf /home/box/web/etc/gunicorn_django.conf   /etc/gunicorn.d/django
cd /home/box/web
django-admin startproject ask
cd /home/box/web/ask
python manage.py startapp qa 
echo "from django.http import HttpResponse 
def test(request, *args, **kwargs):
    return HttpResponse('OK')" >> /home/box/web/ask/qa/views.py
cp -f /home/box/web/urls.py /home/box/web/ask/ask/urls.py

sudo service nginx reload
sudo service nginx restart
sudo /etc/init.d/gunicorn restart

sudo /etc/init.d/mysql restart
mysql -uroot -e "create database stepic;"
mysql -uroot -e "CREATE USER 'gena'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON * . * TO 'gena'@'localhost';"
mysql -uroot -e "FLUSH PRIVILEGES;"