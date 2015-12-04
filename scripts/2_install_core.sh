#install_core.sh installs packages and gets the code
#and data required for the reference environment.  Configuration
#usually happens later in configure_core.sh unless something 
#depends on it here.

log=/vagrant/temp/install.log
echo Started install_core.sh | tee -a $log

echo Installing packages | tee -a $log

	wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
	sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu precise-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'

	sudo apt-get -y update 
	sudo apt-get -y install octave xfig reduce-algebra evince epstool fig2ps
	sudo apt-get -y autoremove
	sudo apt-get -y install --no-install-recommends tex-common texlive-base texlive-base-bin texlive-font-utils texlive-latex-extra

echo Completed package installation | tee -a $log

echo Getting code | tee -a $log
	git clone https://github.com/uomsystemsbiology/energetic_cost.git ~/gawseikam16/Examples

echo Getting build info from git | tee -a $log
	git --git-dir ~/gawseikam16/Examples/.git log --max-count=1 --format=format:"Last Commit: %h%nAuthor: %an%nCommit Date: %ad%n" > /vagrant/temp/build_info.txt

echo Writing build info into build_info.txt | tee -a $log
	printf '\nEnvironment built at ' >> /vagrant/temp/build_info.txt
	date >> /vagrant/temp/build_info.txt

echo Got code | tee -a $log

echo Completed install_core.sh | tee -a $log
