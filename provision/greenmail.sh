# Install greenmail
HOME=/home/vagrant
JBOSS_HOME=$HOME/jboss
GREENMAILFINAL=greenmail-1.3.1b
JBOSS_SERVICE=jboss-service-1.3
JBOSS_DEPLOYMENTS=$JBOSS_HOME/server/default/deploy
SERVERIP=0.0.0.0

cd $HOME
mkdir -p greenmail
cd greenmail
if [ ! -f $GREENMAILFINAL.zip ]; then
  wget http://ufpr.dl.sourceforge.net/project/greenmail/greenmail/1.3.1b/$GREENMAILFINAL.zip
fi
mkdir -p server
cd $HOME/greenmail/server
unzip -ox ../$GREENMAILFINAL.zip

if [ ! -f greenmail-$JBOSS_SERVICE.sar ]; then
  wget http://ufpr.dl.sourceforge.net/project/greenmail/greenmail/greenmail-1.3/greenmail-$JBOSS_SERVICE.sar
fi
sudo chown -R vagrant:vagrant $HOME/greenmail

# Activate greenmail on jboss
cd $JBOSS_DEPLOYMENTS
mkdir -p greenmail-jboss-service.sar
cd greenmail-jboss-service.sar
jar xvf $HOME/greenmail/server/greenmail-$JBOSS_SERVICE.sar
sudo chown -R vagrant:vagrant $JBOSS_DEPLOYMENTS/greenmail-jboss-service.sar

# Start jboss
cd $JBOSS_HOME/bin
echo "Please vagrant ssh then manually run.sh to start jboss+greenmail and see it works in http://localhost:8080/jmx-console/"
ls -la --color run.sh

# test:
#  open http://localhost:8080/jmx-console/
