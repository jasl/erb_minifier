module ErbMinifier
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<DESC
Description:
    Copies ERB Minifier initialize file to your application's initializer directory.
DESC

      def copy_initializer_file
        template 'erb_minifier.rb', 'config/initializers/erb_minifier.rb'
      end
    end
  end
end
