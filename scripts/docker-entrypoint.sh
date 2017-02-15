#!/bin/bash

set -o errexit # Exit on error

cd /opt/app
npm install --no-bin-links
gulp serve
