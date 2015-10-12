mkdir -p /home/vagrant/app/
cd /home/vagrant/ && wget https://github.com/sourcefabric/Newscoop/archive/v4.4.zip && unzip v4.4.zip && rm v4.4.zip && rsync -av Newscoop-4.4/ app/ && rm -rf Newscoop-4.4/
cd /home/vagrant/app/newscoop/ && curl -s https://getcomposer.org/installer | php && php composer.phar install  --no-dev