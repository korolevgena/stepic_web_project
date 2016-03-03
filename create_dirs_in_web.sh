mkdir public/img -p
mkdir public/js -p
mkdir public/css -p
mkdir uploads

sudo apt-get update 
sudo apt-get install nginx
sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo rm /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/gunicorn   /etc/gunicorn.d/test
sudo /etc/init.d/gunicorn restart
sudo service nginx restart