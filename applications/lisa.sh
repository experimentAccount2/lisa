#!/bin/bash
SCRIPT_PATH="${BASH_SOURCE[0]}";
cd `dirname ${SCRIPT_PATH}` > /dev/null
cd ..
#cd ../../../../

python src/update_stable.py
python lisa.py $@

#git pull
#git submodule update --init --recursive
#python src/organ_segmentation.py


#cd /Users/mjirik/projects/liver-surgery/
#git checkout stable
#git pull
#echo `pwd`
#echo $SCRIPT_PATH
#python /Users/mjirik/projects/liver-surgery/src/organ_segmentation.py
#python /Users/mjirik/projects/liver-surgery/src/organ_segmentation.py
