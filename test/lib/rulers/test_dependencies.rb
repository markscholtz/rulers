require_relative "../../test_helper"
require "test/unit"

class DependenciesTest < Test::Unit::TestCase

  def test_loading_a_nonexistant_constant_raises_rulers_autoload_error
    assert_raise Rulers::AutoLoadError do
      Object.const_missing("NonExistantConstant")
    end
  end

  def test_loading_a_nonexistant_constant_successfully
    assert_raise Rulers::AutoLoadError do
      Object.const_get("DependenciesController")
    end

    root = File.expand_path("..", File.dirname(__FILE__))
    $LOAD_PATH << File.join(root, "test", "dependencies_test_path")

    result = Object.const_get("DependenciesController")
    assert result == DependenciesController
  end
end

