require 'rails/generators'

module JuspayCheckout
  module Generators
    class InstallGenerator < Rails::Generators::Base
    	def self.source_root
        source_root ||= File.join(File.dirname(__FILE__), 'templates/')
      end

      def copy_validate_api_yml_file
      	copy_file "juspay.yml", "config/juspay.yml"
      end

    end
  end
end