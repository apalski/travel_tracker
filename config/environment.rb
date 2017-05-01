require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= "development"

ActiveRecord::Base.establish_connection(
	:adapter => "sqlite3",
	:database => "db/tt#{ENV['SINATRA_ENV']}.SQLITE"
)

require 'pry'
require 'rack-flash'


require_all 'app'

