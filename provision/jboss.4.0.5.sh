# Install jboss 4.0.5
HOME=/home/vagrant
JBOSS_HOME=$HOME/jboss
JBOSSFINAL=jboss-4.0.5.GA

mkdir -p $HOME/src/jboss
sudo chown -R vagrant:vagrant $HOME/src
cd $HOME/src/jboss

if [ ! -f $JBOSSFINAL.zip ]; then
  wget "http://ufpr.dl.sourceforge.net/project/jboss/JBoss/JBoss-4.0.5.GA/$JBOSSFINAL.zip"
fi

if [ ! -d $JBOSSFINAL ]; then
  mkdir -p $JBOSSFINAL
  cd $JBOSSFINAL
  unzip -ox ../$JBOSSFINAL.zip
  sudo rm -rf $JBOSS_HOME
  mv $JBOSSFINAL $JBOSS_HOME
  sudo chown -R vagrant:vagrant $JBOSS_HOME
  cd $JBOSS_HOME/bin
  ls -la --color
fi

if [ ! -f /usr/bin/jboss ]; then
  sudo cp /vagrant/bin/jboss /usr/bin/
fi
