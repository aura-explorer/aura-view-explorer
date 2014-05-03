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
		
		get '/block/:height' do
			block = settings.chain_block_controller.get_by_height params[:height]
			block = settings.chain_block_controller.get_by_hash params[:height] if block.nil?
			
			if block.nil?
				status 404
				"404"
			else
				erb :block, :locals => {:block => block}
			end
		end
	end
end
