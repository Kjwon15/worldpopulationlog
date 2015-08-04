#!/bin/bash

export LC_TIME=en_US.UTF-8
date=$(date +%d)
month=$(date +%B)
full_date=$(date +%Y-%m-%d)
population=$(\
    curl api.population.io/1.0/population/World/${full_date}/ |\
    cut -d: -f4 |\
    tr -d '[[:space:]]}')

git checkout log
git merge master --no-edit
mv ${date}.* ${date}.${month}
git commit -am "$population"
