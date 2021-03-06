#sudo yum update
#sudo yum install -y git
#git clone https://github.com/philosopeace1/dotfiles
#sh dotfiles/install_sh
cd ~/

sudo yum install -y httpd php mysql-server gcc make ncurses-devel patch make php-mysql tree php-devel httd-devel php-pear php-gd  php-mbstring php-pecl-apc memcached  php-pecl-memcached php-pecl-memcache php-mcrypt gettext  mod_ssl mongo-10gen mongo-10gen-server libyaml-devel libxslt-dev libxml2-dev libsqlite3-dev libtool libxslt libksba openssl sqlite-devel curl-devel httpd-devel mysql-devel gcc-c++ postfix mailx


#vim 
echo "install vim7.3"
wget http://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar jxfv vim-7.3.tar.bz2
mkdir vim73/patches
cd vim73/patches
seq -f http://ftp.vim.org/pub/vim/patches/7.3/7.3.%03g 3 | xargs wget
cd ../
cat patches/7.3.* | patch -p0
./configure --prefix=/usr --enable-multibyte --with-features=huge --disable-selinux
make
sudo make install
vim --version
cd ~/
rm vim-7.3.tar.bz2
rm -rf vim73

#vim-extra
echo "install vim-extra"
cd ~/
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle; curl -Sso ~/.vim/autoload/pathogen.vim \https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#ctags 
echo "install ctags"
cd ~/
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar xzf ctags-5.8.tar.gz
cd ctags-5.8
./configure
make
sudo make install
ctags --version

#chkconfig
cd ~/
pwd
sudo chkconfig mysqld on
sudo chkconfig httpd on
chkconfig --list

#make sybnbolic link
echo "make sybnbolic link"
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.inputrc ~/.inputrc

#mongodb
echo "install mongodb"
echo "[10gen]
name=10gen Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64
gpgcheck=0
enabled=1" | sudo tee -a /etc/yum.repos.d/10gen.repo
sudo yum install -y mongo-10gen-server


#ruby
echo "install ruby"
curl -L https://get.rvm.io | bash -s
source /home/ec2-user/.rvm/scripts/rvm
rvm get stable
rvm reload
rvm install 2.0.0 --with-openssl-dir=$HOME/.rvm/usr
#rvm use 2.0.0@railstutorial_rails_4_0 --create --default
#which gem
#gem update --system 2.0.3
#gem install rails
#gem install bundle
#gem install nokogiri
#gem install passenger
#passenger-install-apache2-module
pwd

#node.js
echo "install node.js"
cd ~/
git clone git://github.com/joyent/node.git
cd node/
./configure
sudo make install
node -v

#postfixの設定

#vagrantのみ
sudo chkconfig iptables off
