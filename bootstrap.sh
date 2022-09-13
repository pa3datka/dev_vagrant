sudo apt-get update && sudo apt-get install -y \
  git unzip pip sshpass curl\
  php7.4-cli php7.4-xml php7.4-tokenizer php7.4-simplexml php7.4-xmlwriter

# copy ssh-key in vagrant

cp /vagrant/ssh-keys/owner.id_rsa ~/.ssh/owner.id_rsa
cp /vagrant/ssh-keys/owner.id_rsa.pub ~/.ssh/owner.id_rsa.pub
chmod 600 ~/.ssh/owner.id_rsa