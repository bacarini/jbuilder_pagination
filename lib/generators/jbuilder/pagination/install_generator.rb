module Jbuilder::Pagination
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy jbuilder_paginate initializer"
      source_root File.expand_path('../templates', __FILE__)

      class_option :will_paginate, type: :boolean, desc: 'will_paginate compatible initializer.'
      class_option :kaminari, type: :boolean, desc: 'kaminari compatible initializer.'

      def copy_config
        if options[:kaminari]
          template "config/initializers/jbuilder_pagination_kaminari.rb"
        else
          template "config/initializers/jbuilder_pagination_will_paginate.rb"
        end
      end
    end
  end
end
