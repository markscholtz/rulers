require_relative "../../test_helper"

# Wrap this class in a module.
# If loaded first it will cause the test_app's TestController to not load
# causing strange test bugs when run with Rake test"to not load causing strange
# test bugs when run with "Rake test"
module EmptyController
  class TestController < Rulers::Controller
  end
end

class RoutingTest < Test::Unit::TestCase

  def test_get_controller_and_action
    path_info = { "PATH_INFO" => "/test/index/extra/stuff" }
    result = Rulers::Application.new.get_controller_and_action(path_info)

    assert result == [TestController, "index"]
  end
end

