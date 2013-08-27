module SpreeItalianExtra
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_italian_extra'
      end

      def add_javascripts
        append_file 'app/assets/javascripts/store/all.js', "//= require store/spree_italian_extra\n"
      end

      def add_seeds
        append_to_file 'db/seeds.rb', 'Spree::ItalianExtra::Engine.load_seed if defined?(Spree::ItalianExtra)'
      end

      def run_migrations
         res = ask 'Would you like to run the migrations now? [Y/n]'
         if res == '' || res.downcase == 'y'
           run 'bundle exec rake db:migrate'
         else
           puts 'Skipping rake db:migrate, don\'t forget to run it!'
         end
      end

      def load_data
        res = ask 'Would you like to add data (italian regions)? [Y/n]'
        if res.downcase == 'y'
          Spree::ItalianExtra::Engine.load_seed if defined?(Spree::ItalianExtra)
        end
      end
    end
  end
end
