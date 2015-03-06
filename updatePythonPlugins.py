#!/usr/bin/python

from os import listdir, chdir, getcwd
from subprocess import call

bundles = '~/.vim/bundle/'
chdir(bundles)
for bundle in listdir(bundles):
    print "updating bundle ", bundle
    chdir(bundle)
    try:
        call(['git','pull'])
    except:
        print "cannot update plugin", bundle
    chdir('..')
