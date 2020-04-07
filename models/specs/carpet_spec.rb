require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../carpet")

class TestCarpet < Minitest::Test

  def setup
    @carpet1 = Carpet.new({
      "brand" => "Carpettest",
      "buying_cost" => 4.37
      })
  end

  def test_markup()
    result = @carpet1.markup
    assert_equal(9.99, result)
  end












end
