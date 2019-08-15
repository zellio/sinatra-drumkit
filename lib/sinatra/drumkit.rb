require 'sinatra/base'

#
module Sinatra
  #
  module Drumkit
    def rhythm(app_dir: nil, model_dir: nil, controller_dir: nil,
               namespace: Sinatra::Drumkit)

      app_dir ||= File.join(root, 'app')
      model_dir ||= File.join(app_dir, 'models')
      controller_dir ||= File.join(app_dir, 'controllers')

      model_module = model_autoloader(model_dir)
      namespace.const_set(:Model, model_module)

      load_controllers(controller_dir)
    end

    private

    def model_autoloader(load_dir)
      Module.new do
        define_singleton_method(
          :const_missing, lambda { |const|
            @searched ||= {}
            raise "Class not found: #{const}" if @searched[const]
            require File.join(load_dir, "#{const.to_s.downcase}.rb")
            @searched[const] = true
            const_get(const) || raise("Class not found: #{const}")
          }
        )
      end
    end

    def load_controllers(load_dir)
      Dir[::File.join(load_dir, '**/*.rb')].each do |file|
        instance_eval(File.read(file), file)
      end
    end
  end

  register Drumkit
end
