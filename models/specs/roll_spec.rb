require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../carpet")
require_relative("../roll")

class TestRoll < Minitest::Test

  def setup

    @carpet1 = Carpet.new({
      "brand" => "Carpettest",
      "buying_cost" => 4.37
      })

    @roll1 = Roll.new({
      "carpet_id" => @carpet1.id,
      "colour" => "Testcolour",
      "roll_width" => 5,
      "roll_length" => 14.50
      })

    @roll2 = Roll.new({
      "carpet_id" => @carpet1.id,
      "colour" => "Testcolour2",
      "roll_width" => 4,
      "roll_length" => 6.5
      })
  end

  def test_meterage()
    result = @roll1.meterage()
    assert_equal(72.50, result)
  end

  def test_low_stock
    result = @roll2.low_stock()
    assert_equal(true, result)
  end
  
end
