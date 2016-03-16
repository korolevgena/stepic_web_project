mkdir public/img -p
mkdir public/js -p
mkdir public/css -p
mkdir uploads

sudo apt-get update 
sudo apt-get --force-yes -y install nginx
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
cp -f /home/box/web/etc/settings.py /home/box/web/ask/ask/settings.py

sudo service nginx reload
sudo service nginx restart
sudo /etc/init.d/gunicorn restart

sudo /etc/init.d/mysql restart
mysql -uroot -e "create database stepic;"
mysql -uroot -e "CREATE USER 'stepic'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON * . * TO 'stepic'@'localhost';"
mysql -uroot -e "FLUSH PRIVILEGES;"


echo "from django.contrib.auth.models import User

class Question(models.Model):
    title = models.CharField(max_length=50)
    text = models.CharField(max_length=100)
    added_at = models.DateField()
    rating = models.IntegerField()
    author = models.CharField(max_length=20)
    likes = models.ForeignKey(User)
	class Meta:
		db_table = 'question'

class Answer(models.Model):
    text = models.CharField(max_length=100)
    added_at = models.DateField()
    question = models.OneToOneField(Question)
    author = models.CharField(max_length=20)
	class Meta:
		db_table = 'answer'" >> /home/box/web/ask/qa/models.py
	
sudo python /home/box/web/ask/manage.py syncdb 