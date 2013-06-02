require "rulers/array"
require "rulers/controllers"
require "rulers/dependencies"
require "rulers/routing"
require "rulers/util"
require "rulers/version"

module Rulers
  class Application

    def call(env)
      if env["PATH_INFO"] == "/"
        # env["PATH_INFO"] = "/quotes/a_quote"

        index = File.read(File.join($APPLICATION_ROOT, "public", "index.html"))
        return [200, {"Content-Type" => "text/html"}, [index]]

        # begin
        #   home = HomeController.new(env)
        #   text = home.index
        #   return [200, {"Content-Type" => "text/html"}, [text]]
        # rescue => e
        #   raise e
        # end

        # return [307, {"Content-Type" => "text/html"}, ["Redirect!"]]
      elsif env["PATH_INFO"] == "/favicon.ico"
        return [404, {"Content-Type" => "text/html"}, []]
      end

      klass, action = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(action)
      rescue => e
        # return [500, {"Content-Type" => "text/html"}, ["Something terrible happened"]]
        raise e
      end

      [200, {"Content-Type" => "text/html"}, [text]]
    end
  end
end

