require 'rubygems'
require 'bundler/setup'
Bundler.require
Bundler.require :development unless ENV['RACK_ENV'] == 'production'
require './controller'
run Controller
