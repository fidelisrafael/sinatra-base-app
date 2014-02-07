# -*- encoding : utf-8 -*-
module SinatraApp
	module Apps
		class ApplicationController < Sinatra::Base
			helpers ApplicationHelper

      RESPOND_TO              = ["json", "xml", 'html']
      DEFAULT_RESPONSE_FORMAT = 'html'

      CONTENT_TYPES = {
        "json" => "application/json",
        "html" => "text/html; charset=UTF-8",
        "xml"  => "application/xml"
      }

			set :root			, File.join('..' , File.dirname(__FILE__))
			set :raise_errors 	, true
			set :show_exceptions, true

      protected

      def response_formats
        return self.class.const_get(:RESPOND_TO)
      end
      
      def valid_request_format?(format)
        response_formats.include?(format.downcase)
      end

      def not_allow_invalid_formats
        halt 409 if !valid_request_format?(request_format)
      end

      def request_format
        params[:format] ||= self.class.const_get(:DEFAULT_RESPONSE_FORMAT)
        params[:format]
      end

      def respond_to(value=nil, &block)
        not_allow_invalid_formats
        if !block.nil? && block_given?
          value = yield
        end
        method = "to_" + request_format        
        set_content_type
        value.respond_to?(method) ? value.send(method) : value
      end

      def set_content_type
        types = self.class.const_get(:CONTENT_TYPES)        
        content_type types[request_format] || "text/html; charset=UTF-8"
      end
		end
	end
end
