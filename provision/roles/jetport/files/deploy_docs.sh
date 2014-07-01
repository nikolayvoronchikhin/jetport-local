#!/usr/bin/env bash

pwd
echo ${1}
cd ${1}
pwd
source bin/activate
echo ${2}
cd ${2}
pwd
python setup.py build_sphinx
cp -R doc/build/html/* /var/www/html/docs/

