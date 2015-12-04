#configure_core.sh sets up applications, compiles code and puts scripts
#in the appropriate places.  It runs after all the installation commands
#have completed

log=/vagrant/temp/install.log
echo Started configure_core.sh | tee -a $log

echo Copying login message to /etc/motd | tee -a $log
sudo cp /vagrant/temp/data/motd /etc/motd

echo Copying shell script to home directory | tee -a $log
sudo cp /vagrant/temp/data/run_experiments.sh /home/sbl/run_experiments.sh
sudo chmod 777 /home/sbl/run_experiments.sh

echo Linking the shell script into the root folder | tee -a $log
sudo ln -sv /home/sbl/run_experiments.sh /run_experiments.sh

echo Giving rwx permissions to everything | tee -a $log
sudo chmod -R 777 /home/sbl/gawseikam16/Examples

echo Setting the default graphics toolkit for Octave to gnuplot
printf "graphics_toolkit gnuplot" >> /home/sbl/.octaverc

echo Completed configure_core.sh | tee -a $log
