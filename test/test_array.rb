require_relative "test_helper"

class ArrayTest < Test::Unit::TestCase

  def test_summing_an_array
    array =[1, 3, 5]
    result = array.sum
    expect = 9
    assert result == expect, "Expected: #{expect}, Got #{result}"
  end
end
