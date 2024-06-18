git clone https://github.com/tfutils/tfenv.git ~/.tfenv

mkdir ~/bin

ln -s ~/.tfenv/bin/* ~/bin/
# install latest version
tfenv install latest

tfenv use latest

source mysql.tf