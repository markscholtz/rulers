require "erubis"

module Rulers
  class Controller

    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, "")
      Rulers.to_underscore klass
    end

    def render(view_name, locals = {})
      filename = File.join $APPLICATION_ROOT, "app", "views", controller_name, "#{view_name}.html.erb"
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)

      ivars = self.instance_variables
      ivars.each do |ivar|
        value = self.instance_variable_get(ivar)
        eruby.instance_variable_set(ivar, value)
      end

      eruby.result locals.merge(:env => env,
                                :controller_name => controller_name,
                                :application_root => $APPLICATION_ROOT)
    end
  end
end

