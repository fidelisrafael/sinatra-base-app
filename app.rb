# -*- encoding : utf-8 -*-
require 'rubygems'
require 'sinatra'

module SinatraApp
	module Apps
		ROOT_DIR = File.dirname(__FILE__) if !defined?(Apps::ROOT_DIR)
	end
end

require File.join(File.dirname(__FILE__), 'app' , 'bootstrap')
