require_relative "test_helper"

class RulersTest < Test::Unit::TestCase

  def test_application_root
    app = Rulers::Application.new
    app.application_root = "root"
    assert app.application_root == "root", "Root not set."
  end
end
