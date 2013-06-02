require_relative "../../test_helper"

class TestController < Rulers::Controller
end

class ControllerTest < Test::Unit::TestCase

  def test_env
    env = { one: "one", two: "two" }
    controller = Rulers::Controller.new(env)
    result = controller.env
    assert result == env, "Expected: #{env}, Got #{result}"
  end

  def test_controller_name
    controller = TestController.new({})
    result = controller.controller_name
    expected = "test"
    assert result == expected, "Expected: #{expected}, Got #{result}"
  end

  def test_render
    $APPLICATION_ROOT = File.expand_path("controller_test_path", File.dirname(__FILE__)) # Store this in some sort of config object in Rulers eventually

    controller = TestController.new({})
    result = controller.render("test", name: "Joanne")
    expected =<<EOS
<p>
  Hello Joanne!
</p>

EOS
    assert result == expected, "Expected: #{expected}, Got #{result}"
  end

  def test_controller_instance_variable_passing
    assert true == false
  end
end

