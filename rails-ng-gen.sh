#!/bin/bash
# Basic Rails + Angular scaffolding generator 
# Assuming Rails, Node, Compass, Yeoman, Angular Generator, 
# and Grunt CLI are already installed 

$APP_NAME = $1
$PATH     = $2

# Generate Rails API and copy over files 
rails-api new $PATH/$APP_NAME --skip-test-unit
cp default-gemfile $PATH/$APP_NAME/Gemfile

# cd into directory and begin Rails-related installs
cd $PATH/$APP_NAME
bundle install 
rails g rspec:install 
rails g figaro:install 
rails g devise:install 

# Create client directory and begin Angular-related intalls 
mkdir client/
cd client/
sudo yo angular $APP_NAME
npm install --save-dev grunt-connect-proxy
