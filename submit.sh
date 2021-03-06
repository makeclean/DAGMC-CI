#!/bin/sh

if [ -z $1 ]
then
   echo "Error: No run-spec specified"
   exit 1
fi

path=`pwd`
echo \
"method  = scp
scp_file = $path/build.sh
">$path/build.scp

echo \
"method  = scp
scp_file = $path/build.sl6.sh
">$path/build.sl6.scp

echo  \
"method   = scp
scp_file  = $HOME/gcc_SL6/*
recursive = true
">$path/gcc.sl6.scp

echo \
"method   = scp
scp_file  = $HOME/fluka/*
recursive = true
">$path/fluka.scp

echo \
"method  = scp
scp_file = $path/generate_test_list.sh
">$path/generate_test_list.scp

echo \
"method   = scp
scp_file  = $path/gen_test_list.py
recursive = true
">$path/gen_test_list.py.scp

echo \
"method  = scp
scp_file = $path/run-test.sh
">$path/run-test.scp

nmi_submit $1
