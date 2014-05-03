require "rubygems"
require "sinatra"
require "sinatra/reloader"
require "mysql2"
require "active_record"
require "date"

$LOAD_PATH.unshift(File.dirname(__FILE__) + "/")
$LOAD_PATH.unshift(File.dirname(__FILE__) + "/lib/")

# TODO: config file
ActiveRecord::Base.establish_connection(
	:adapter => 'mysql2',
	:database => 'abe',
	:username => 'abe',
	:password => 'PASSWORD'
)
chain_id = 8

require 'aura-model/aura-model'
require 'aura-controller/aura-controller'

require 'app.rb'

chain_block_controller = Aura::Controller::ChainBlockController.new chain_id
Aura::ExplorerApp.set :chain_block_controller, chain_block_controller

run Aura::ExplorerApp
