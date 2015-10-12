if [ -d "/home/vagrant/app/newscoop/themes/publication_1/theme_1/" ]; then
     mount -o bind /vagrant/app/ /home/vagrant/app/newscoop/themes/publication_1/theme_1/
fi
service apache2 restart
