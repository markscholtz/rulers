require "erubis"

module Rulers
  class Controller

    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def render(view_name, locals = {})
      filename = File.join $APPLICATION_ROOT, "app", "views", controller_name, "#{view_name}.html.erb"
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(:env => env,
                                :controller_name => controller_name,
                                :application_root => $APPLICATION_ROOT)

    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, "")
      Rulers.to_underscore klass
    end
  end
end

