#!/bin/sh

# Set up logfile
log=/home/sbl/run_experiments.log

echo;echo;echo
echo "### Overview
This shell script is part of the reference environment for the manuscript 
['Hierarchical Bond Graph Modelling of Biochemical Networks'](http://arxiv.org/abs/1503.01814).  
It executes code to reproduce specific results described in the manuscript.   
You can find more information about this research at the 
[project page here](http://uomsystemsbiology.github.io/hbgm/).  

To find other versions of this reference environment, see Other Links below.  
To learn more about reference environments, 
[see the detailed description here]http://uomsystemsbiology.github.io/reference-environments/).  

### Instructions for use

This shell script reproduces results described in the manuscript and writes 
output to /home/sbl/gawseikam16/Examples.

### Other links

[Manuscript link](http://arxiv.org/abs/1503.01814)

[Project page link](http://uomsystemsbiology.github.io/hbgm/)

[Docker container](https://hub.docker.com/r/uomsystemsbiology/hbgm/)

[Vagrant-managed virtual machine](https://github.com/uomsystemsbiology/hbgm_reference_environment)

[Bootable ISO](https://dx.doi.org/10.5281/zenodo.29623)"
echo

# Change to project directory
cd /home/sbl/gawseikam16/Examples

echo Executing makefile | tee -a $log
sleep 2
./Make 2>&1 | tee -a $log

echo Opening PDF output | tee -a $log
if [ ! -s $DISPLAY ]; then evince paper_notext.pdf
else echo 'PDF generated at /home/sbl/gawseikam16/Examples/paper_notext.pdf'
fi;

echo Completed analysis | tee -a $log
echo;echo
$SHELL
