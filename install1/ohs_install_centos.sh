#yum groupinstall "Development Tools"
yum install -y gcc-c++ mariadb-libs mariadb-devel
yum install -y screen tar wget unzip bzip2 bzip2-devel gmp-devel
ln -s /usr/lib64/mysql/libmysqlclient.so /usr/lib64/libmysqlclient.so


# Installing Git New Version
yum remove -y git
yum install -y https://centos7.iuscommunity.org/ius-release.rpm
yum install -y git2u
git --version


cd /home
#https://yadi.sk/d/tbVwfjSD9m4Qzg
wget http://downloads.sourceforge.net/project/boost/boost/1.54.0/boost_1_54_0.tar.bz2
tar xjf boost_1_54_0.tar.bz2
cd /home/boost_1_54_0
./bootstrap.sh --with-libraries=filesystem,program_options,system,regex,thread,date_time --libdir=/usr/lib/
./bjam
./bjam install


cd /home
git clone https://github.com/b1glord/OHSystem.git
cd /home/OHSystem/ghost/src/bncsutil/src/bncsutil
make
make install
cp /home/OHSystem/ghost/src/bncsutil/src/bncsutil/libbncsutil.so /usr/lib64/libbncsutil.so
ln -s /home/OHSystem/ghost/src/bncsutil/src/bncsutil/libbncsutil.so /usr/lib/libbncsutil.so

cd /home/OHSystem/ghost/src/StormLib/stormlib
make
make install
cp /home/OHSystem/ghost/src/StormLib/stormlib/libStorm.so /usr/lib64/libStorm.so
ln -s /home/OHSystem/ghost/src/StormLib/stormlib/libStorm.so /usr/lib/libStorm.so
cd /home/OHSystem/ghost/src
make


# Final Step Copy Building Files... (Uyari! Sadece Kok [root] dizinde calisiyor)
cd /home/OHSystem/ghost
mkdir ~root/bot
mkdir ~root/bot/maps/ ~root/bot/replays/ ~root/bot/savegames/
cp src/ghost++ ~root/bot/
cp config/* ~root/bot -R
cp plugins ~root/bot/ -R
cp mapcfgs/ ~root/bot/ -R
cp w3/ ~root/bot/ -R

# Make Log File DIR...
mkdir /usr/local/var/ghost