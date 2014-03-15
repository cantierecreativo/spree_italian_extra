module Spree
  module ItalianExtra
    class Engine < Rails::Engine
      require 'spree/core'
      isolate_namespace Spree
      engine_name 'spree_italian_extra'

      config.autoload_paths += %W(#{config.root}/lib)

      # use rspec for tests
      config.generators do |g|
        g.test_framework :rspec
      end

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), '../../../app/**/*_decorator*.rb')) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end

      end

      config.to_prepare &method(:activate).to_proc

      initializer "spree_italian_extra.environment", before: :load_config_initializers do |app|
        Spree::PermittedAttributes.address_attributes << :tax_code
      end
    end
  end
end