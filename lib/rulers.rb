require "rulers/array"
require "rulers/controller"
require "rulers/dependencies"
require "rulers/routing"
require "rulers/util"
require "rulers/version"

module Rulers
  class Application

    def application_root
      @root
    end

    def application_root=(root)
      @root = root
    end

    def call(env)
      if env["PATH_INFO"] == "/"
        index = File.read(File.join(application_root, "public", "index.html"))
        return [200, {"Content-Type" => "text/html"}, [index]]
      elsif env["PATH_INFO"] == "/favicon.ico"
        return [404, {"Content-Type" => "text/html"}, []]
      end

      klass, action = get_controller_and_action(env)
      controller = klass.new(env, application_root)

      begin
        text = controller.send(action)
      rescue => e
        raise e
      end

      [200, {"Content-Type" => "text/html"}, [text]]
    end
  end
end

