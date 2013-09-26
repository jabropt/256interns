require 'test/unit'
require './numericinspector'
 
class TC_NumericInspector < Test::Unit::TestCase
 
  def setup
    @obj = NumericInspector.new
  end
 
  def test_is_negative
    assert(!@obj.is_negative(1), "1 が負の数として判定されました。")
    assert(@obj.is_negative(-1.5), "-1.5 が負の数として判定されませんでした。")
    assert(!@obj.is_negative(0), "0 が負の数として判定されました。")
  end
 
  def test_is_integer
    assert(@obj.is_integer(1), "1 が整数として判定されませんでした。")
    assert(!@obj.is_integer(1.5), "1.5 が整数として判定されました。")
  end
 
end
