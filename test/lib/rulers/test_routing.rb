require_relative "test_helper"

class TestController < Rulers::Controller
end

class RoutingTest < Test::Unit::TestCase

  def test_get_controller_and_action
    path_info = { "PATH_INFO" => "/test/index/extra/stuff" }
    result = Rulers::Application.new.get_controller_and_action(path_info)

    assert result == [TestController, "index"]
  end
end

