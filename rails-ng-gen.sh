#!/bin/bash
# Basic Rails + Angular scaffolding generator 
# Assuming Rails, Node, Compass, Yeoman, Angular Generator, 

APP_NAME=$1
APP_PATH=$2

# Generate Rails API and copy over files 
rails-api new $APP_PATH/$APP_NAME --skip-test-unit
cp default-gemfile $APP_PATH/$APP_NAME/Gemfile

# cd into directory and begin Rails-related installs
cd $APP_PATH/$APP_NAME
bundle install --without production 
rails g rspec:install 
rails g figaro:install 
rails g devise:install 

# Create client directory and begin Angular-related intalls 
mkdir client/
cd client/
yo angular $APP_NAME
bower install 
sudo npm install 
sudo npm install --save-dev grunt-connect-proxy
