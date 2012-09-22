require 'minitest/unit'
require_relative 'rps_game'

MiniTest::Unit.autorun

class TestRpsGame < MiniTest::Unit::TestCase
  def test_simple_win_lose
    # :rock loses :paper
    turn_person = rps_game([[:rock], [:paper]])
    assert_equal(turn_person, [0, 1])
    
    # :rock wins :scissors
    turn_person = rps_game([[:rock], [:scissors]])
    assert_equal(turn_person, [0, 0])
    
    # :sissors wins :paper
    turn_person = rps_game([[:paper], [:scissors]])
    assert_equal(turn_person, [0, 1])
  end
  
  def test_missing_hands
    # player 1 does not show a hand at 2nd turn, so loses.
    data = [[:rock, :paper], [:rock]]
    turn, person = rps_game(data)
    assert_equal(turn, 1)
    assert_equal(person, 0)
  end
  
  def test_draw
    turn_person = rps_game([[:rock], [:rock]])
    assert_equal(turn_person, [-1, -1])
    
    turn_person = rps_game([[:paper], [:paper]])
    assert_equal(turn_person, [-1, -1])
    
    turn_person = rps_game([[:scissors], [:scissors]])
    assert_equal(turn_person, [-1, -1])
  end  
end
