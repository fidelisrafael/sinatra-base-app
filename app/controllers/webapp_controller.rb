# -*- encoding : utf-8 -*-
module SinatraApp
	module Apps
		class WebApp < ApplicationController

			RESPOND_TO = ["html", "json"]

			helpers WebAppHelper
			
			# https://api.wordpress.org/secret-key/1.1/salt/
			use Rack::Session::Cookie, secret: '$WmuJ>&1J%Zu=6;M=Q$Y!;988jlL^OsXu#ptO&Cs>*1`RAqUF>4g#ELyiStgQN.-'

			enable :static
			enable :logging

			set :public_folder	, 'public'
			set :views					, File.expand_path(File.join(ROOT_DIR, "/app/views/webapp/"));

			get '/' do
				@body_class = @page_title = 'home'
				respond_to do 
					erb :index
				end
			end
			
			get '/sample.?:format?/?' do
				respond_to do |format|
					@page_title = 'Sample Page Title'
					erb '<%= @page_title %>' , layout: false
				end
			end
		end
	end
end
