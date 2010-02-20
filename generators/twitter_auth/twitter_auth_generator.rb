require 'rails/generators/named_base'

module TwitterAuth
  module Generators
    class TwitterAuthGenerator < Rails::Generators::Base
      argument :authtype, :type => :string, :default => "oauth", :banner => "auth=authtype (oauth/basic)"
      
      
      def self.source_root
        @_twitter_auth_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end
      
      desc "Setup twitter auth"
      def create_twitter_auth_setup
        check_class_collision 'User'
        if options[:authtype] == 'basic'
          options[:basic] = true
        else
          options[:oauth] = true
        end
        migration_template 'migration.rb', 'db/migrate', :migration_file_name => 'twitter_auth_migration'
        template 'user.rb', File.join('app','models','user.rb')
        template 'twitter_auth.yml', File.join('config','twitter_auth.yml')
      end
    
  end
end
