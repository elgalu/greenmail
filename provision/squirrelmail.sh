if ! dpkg -s squirrelmail 2>&1 |grep 'Status:'|grep 'ok installed' &> /dev/null; then
  echo "installing squirrelmail"
  # sudo apt-get update
  if [ ! -f "/usr/share/debconf/fix_db.pl" ]; then
    sudo /usr/share/debconf/fix_db.pl
  fi
  sudo apt-get -y install squirrelmail #squirrelmail-locales squirrelmail-decode squirrelmail-viewashtml squirrelmail-logger
fi

echo "override config.php or any file within squirrelmail/"
sudo cp /vagrant/squirrelmail/* /etc/squirrelmail/

if [ ! -f "/etc/apache2/conf.d/squirrelmail.conf" ]; then
  echo "linking squirrelmail.conf to apache2"
  sudo ln -s /etc/squirrelmail/apache.conf /etc/apache2/conf.d/squirrelmail.conf
fi

echo "restart apache"
sudo apache2ctl restart

echo "So everything is setup now!"
echo 
echo "vagrant ssh and run jboss to start greenmail"
echo
echo "Then try the default users at http://localhost/squirrelmail"
echo " test1 pwd1"
echo
echo "Send a mail to yourself, i.e. test1@localhost"
echo "Try to read the mail and you'll get"
echo "  ERROR: Bad or malformed request."
