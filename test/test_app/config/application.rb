require "rulers"

$APPLICATION_ROOT = File.expand_path("..", File.dirname(__FILE__)) # Store this in some sort of config object in Rulers eventually
$LOAD_PATH << File.join($APPLICATION_ROOT, "app", "controllers")

module TestApp
  class Application < Rulers::Application
  end
end

