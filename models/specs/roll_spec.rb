require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../roll")

class TestRoll < Minitest::Test

  def setup
    @roll1 = Roll.new({
      "carpet_id" => 2,
      "roll_width" => 4,
      "roll_length" => 30.00
      })

    @roll2 = Roll.new({
      "carpet_id" => 2,
      "roll_width" => 4,
      "roll_length" => 27.50
      })

    @roll3 = Roll.new({
      "carpet_id" => 1,
      "roll_width" => 5,
      "roll_length" => 30.00
      })

    @roll4 = Roll.new({
      "carpet_id" => 1,
      "roll_width" => 4,
      "roll_length" => 7.45
      })

    @rolls =[@roll1, @roll2, @roll3, @roll4]

  end

  def test_cut_roll_true()
    result = @roll1.cut_roll(14.65)
    assert_equal(15.35, result)
  end

  def test_cut_roll_false()
    result = @roll4.cut_roll(13.80)
    assert_equal("Not enough stock, please try another roll.", result)
  end

  def test_full_roll_true()
    result = @roll3.full_roll
    assert_equal(true, result)
  end

  def test_full_roll_false()
    result = @roll4.full_roll
    assert_equal(false, result)
  end




end
