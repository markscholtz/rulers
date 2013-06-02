require_relative "../../test_helper"

class UtilTest < Test::Unit::TestCase

  def test_to_underscore
    result = Rulers.to_underscore("My-Awesome::CSV1Parser27G::NEXT6Time")
    expected = "my_awesome/csv1_parser27_g/next6_time"
    assert result == expected, "Expected: #{expected}, got: #{result}"
  end
end

