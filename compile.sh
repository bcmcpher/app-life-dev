#!/bin/bash
module load matlab/2019a

log=compiled/commit_ids.txt
true > $log

echo "/geode2/home/u010/bcmcpher/Carbonate/matlab/encode" >> $log
(cd /geode2/home/u010/bcmcpher/Carbonate/matlab/encode && git log -1) >> $log

echo "/N/u/brlife/git/vistasoft" >> $log
(cd /N/u/brlife/git/vistasoft && git log -1) >> $log

echo "/N/u/brlife/git/jsonlab" >> $log
(cd /N/u/brlife/git/jsonlab && git log -1) >> $log

cat > build.m <<END
addpath(genpath('/geode2/home/u010/bcmcpher/Carbonate/matlab/encode'))
addpath(genpath('/N/u/brlife/git/vistasoft'))
addpath(genpath('/N/u/brlife/git/jsonlab'))
mcc -m -R -nodisplay -a /N/u/brlife/git/encode/mexfiles -d compiled main
exit
END

matlab -nodisplay -nosplash -r build && rm build.m

