require_relative '../config/environment'


ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  # :adapter => 'sqlite3_adapter.rb',
  :adapter => 'sqlite3',
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  # :database =>  'sinatra_application.sqlite3.db'
  # :database => "db/#{ENV['SINATRA_ENV']}.sqlite3"
)

require './app/controllers/application_controller'
require_all 'app'
