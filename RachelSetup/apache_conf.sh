cp ~/Setup/rachel.conf /etc/apache2/sites-available/
a2ensite rachel.conf
a2dissite 000-default.conf
service apache2 reload
