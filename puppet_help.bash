#!/bin/bash

# install prebuild puppet module
puppet module install puppetlabs-ntp --target-dir .

# print module paths
puppet config print modulepath

# cd into modulepath & then run to create a new module
/usr/local/bin/pdk new module rpms --skip-interview

# cd into <module name> & then run to create a new class
/usr/local/bin/pdk new class ntp::install

