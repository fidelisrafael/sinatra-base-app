# encoding: UTF-8
require "./app"

map('/') 	{ run SinatraApp::Apps::WebApp }
map('/api') { run SinatraApp::Apps::API 	 }