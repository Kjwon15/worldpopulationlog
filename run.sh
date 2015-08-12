#!/bin/bash

export GIT_COMMITER_NAME='autocommit'
export GIT_COMMITER_EMAIL='autocommit@802.11ac.net'

export LC_TIME=en_US.UTF-8
date=$(date +%d)
month=$(date +%B)
full_date=$(date +%Y-%m-%d)
population=$(\
    curl api.population.io/1.0/population/World/${full_date}/ |\
    cut -d: -f4 |\
    tr -d '[[:space:]]}')

git checkout log
git mv ${date}.* ${date}.${month}
git commit --author="$GIT_COMMITER_NAME <$GIT_COMMITER_EMAIL>" -am "$population"
git checkout master
