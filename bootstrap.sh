add-apt-repository -y ppa:chris-lea/node.js
apt-get update && apt-get upgrade -y

debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'

apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev apache2-mpm-itk git nodejs g++ libjpeg-dev libpng-dev libapache2-mod-php5 php5-cli php5-curl php5-mysql php5-gd php5-intl php5-xcache imagemagick mysql-server unzip

#install tty.js
npm install -g tty.js

#create mysql user and db
mysql -u root -pvagrant -e "CREATE DATABASE vagrant;"
mysql -u root -pvagrant -e "GRANT ALL PRIVILEGES ON vagrant.* TO 'vagrant'@'localhost' IDENTIFIED BY 'vagrant';"

#create app dirs
mkdir /vagrant/logs
mkdir /vagrant/app

#set apache2 configs
export SITEDOMAIN=`cat /vagrant/config/site-domain`
sed -e 's/\{\{alias\}\}/$SITEDOMAIN/g' /vagrant/config/apache2.conf > /etc/apache2/sites-available/php.conf
ln -s /etc/apache2/sites-available/php.conf /etc/apache2/sites-enabled/php.conf
rm /etc/apache2/sites-enabled/default

#add apache2 modules
ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
ln -s /etc/apache2/mods-available/mpm_itk.load /etc/apache2/mods-enabled/mpm_itk.load

#set php.ini
rsync -av /vagrant/config/php.ini /etc/php5/apache2/php.ini

#set tty.js configs
mkdir /home/vagrant/.tty.js
rsync -av /vagrant/config/config.tty.js /home/vagrant/.tty.js/config.json

