# -*- encoding : utf-8 -*-
module SinatraApp
	require 'json'
	
	module Apps

		APP_ORM_DRIVER = :sqlite


		def self.setup_database_sqlite
			require 'sinatra/activerecord'

			ActiveRecord::Base.establish_connection(
				:adapter  => "sqlite3",
				:database => "#{ROOT_DIR}/db/sinatra_app.sqlite",
				:encoding => 'utf8'
			)
		end

		def self.setup_database
			self.send("setup_database_#{APP_ORM_DRIVER.to_s.downcase}")
		end

		def self.bootstrap_models
			Dir[File.join(ROOT_DIR , "/app/models/**/*.rb")].each {|f|  require f }
		end

		def self.require_files
			self.require_main_application_files
			models = Dir[File.join(ROOT_DIR ,'/app/models/**/*.rb')]
			(Dir[File.join(ROOT_DIR, 'app/{helpers,controllers}/*.rb')] - models).each {|f| require f }
		end

		def self.require_main_application_files
			Dir[File.join(ROOT_DIR, 'app/{helpers,controllers}/{application_helper.rb,application_controller.rb}')].each {|f| require f }
		end


		self.setup_database
		self.bootstrap_models
		self.require_files
	end
end
