require_relative "../../test_helper"

# Wrap this class in a module.
# If loaded first it will cause the test_app's TestController to not load
# causing strange test bugs when run with Rake test"to not load causing strange
# test bugs when run with "Rake test"
module EmptyController
  class TestController < Rulers::Controller
  end
end

class ControllerTest < Test::Unit::TestCase

  def test_env
    env = { one: "one", two: "two" }
    controller = Rulers::Controller.new(env)
    result = controller.env
    assert result == env, "Expected: #{env}, Got #{result}"
  end

  def test_controller_name
    controller = ControllerTest::TestController.new({})
    result = controller.controller_name
    expected = "test"
    assert result == expected, "Expected: #{expected}, Got #{result}"
  end

  def test_render
    controller_test_path = File.expand_path("controller_test_path", File.dirname(__FILE__)) # Store this in some sort of config object in Rulers eventually

    controller = ControllerTest::TestController.new({}, controller_test_path)
    result = controller.render("test", name: "Joanne")
    expected =<<EOS
<p>
  Hello Joanne!
</p>

EOS
    assert result == expected, "Expected: #{expected}, Got #{result}"
  end

  def test_controller_instance_variable_passing
    controller_test_path = File.expand_path("controller_test_path", File.dirname(__FILE__)) # Store this in some sort of config object in Rulers eventually

    controller = ControllerTest::TestController.new({}, controller_test_path)
    controller.instance_variable_set :@test, "joke"
    result = controller.render("test", name: "Joanne")
    expected =<<EOS
<p>
  Hello Joanne!
  Is this a joke?
</p>

EOS
    assert result == expected, "Expected: #{expected}, Got #{result}"
  end
end

