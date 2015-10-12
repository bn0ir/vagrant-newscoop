export THEMENAME=`cat /vagrant/config/theme-name`
if [ -d "/home/vagrant/app/newscoop/themes/unassigned/$THEMENAME/" ]; then
     mount -o bind /vagrant/app/ /home/vagrant/app/newscoop/themes/unassigned/$THEMENAME/
fi
service apache2 restart
