# -*- encoding : utf-8 -*-
module SinatraApp
	module Apps
		class API < ApplicationController
			
			RESPOND_TO 							= ["json", "xml"]
			DEFAULT_RESPONSE_FORMAT = 'json'

			helpers ApiHelper

	  	get '/sample.?:format?/?' do
	  		respond_to do |format|
	  			{ success: 1 , data: [{value: 'string'}, {value: 100.3}] }
	  		end
	  	end
	  end
	end
end