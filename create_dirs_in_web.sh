mkdir public/img -p
mkdir public/js -p
mkdir public/css -p
mkdir uploads

sudo apt-get update 
sudo apt-get install nginx
sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo rm /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/gunicorn.conf   /etc/gunicorn.d/test
sudo /etc/init.d/gunicorn restart
sudo service nginx restart
cd /home/box/web
django-admin startproject ask
cd /home/box/web/ask
python manage.py startapp qa 
echo "from django.http import HttpResponse 
def test(request, *args, **kwargs):
    return HttpResponse('OK')" >> /home/box/web/ask/qa/views.py
cp -f /home/box/web/urls.py /home/box/web/ask/ask/urls.py