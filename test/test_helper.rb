require "rack/test"
require "test/unit"

# Always use local Rulers first
this_dir = File.join(File.dirname(__FILE__), "..")
$LOAD_PATH.unshift File.expand_path(this_dir)

require "pry"
require "rulers"
require_relative "test_app/config/application"

