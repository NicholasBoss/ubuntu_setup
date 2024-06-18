echo "Installing Terraform"
git clone https://github.com/tfutils/tfenv.git ~/.tfenv

mkdir ~/bin

ln -s ~/.tfenv/bin/* ~/bin/
# install latest version
tfenv install latest

tfenv use latest
# download the mysql.tf file
echo "Downloading the mysql.tf file"
curl -o ~/mysql.tf https://raw.githubusercontent.com/NicholasBoss/itm111grading/main/mysql.tf