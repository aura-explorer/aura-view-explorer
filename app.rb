require "rubygems"
require "sinatra/base"
require "sinatra/reloader"
require "mysql2"

module Aura
	class ExplorerApp < Sinatra::Base
		configure :development do
			register Sinatra::Reloader
		end
		
		get '/' do
			blocks = settings.chain_block_controller.get_last
			erb :blocks, :locals => {:blocks => blocks}
		end
	end
end
