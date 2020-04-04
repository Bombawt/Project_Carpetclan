require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../cut")

class TestCut < Minitest::Test

  def setup
    @cut1 = Cut.new({
      "carpet_id" => 5,
      "width" => "4m",
      "length" => 27.65
      })
  end

  def test_cut_carpet_true
    @cut1.cut_carpet(5.60)
    result=@cut1.length
    assert_equal(22.05, result.round(2))
  end

  def test_cut_carpet_false
    result = @cut1.cut_carpet(29.50)
    assert_equal("Not enough stock, please try another roll.", result)
  end












end
