#!/bin/bash
# Basic Rails + Angular scaffolding generator 
# Assuming Rails, Node, Compass and other things are already installed 

$APP_NAME = $1
$PATH     = $2

# Generate Rails API and copy over files 
rails-api new $PATH/$APP_NAME --skip-test-unit
cp default-gemfile $PATH/$APP_NAME/Gemfile

# cd into directory and begin installs
cd $PATH/$APP_NAME
bundle install 
rails g rspec:install 
rails g figaro:install 
rails g devise:install 
