require "rulers"

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

module TestApp
  class Application < Rulers::Application
  end
end

