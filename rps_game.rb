def rps_game(ary)
  turn_max = 0
  ary.each do |person_ary| turn_max = person_ary.length if turn_max <= person_ary.length end
  (turn_max - 1).times do |turn| #何ターン目か
    hand_ary = []
    number_of_winner = 0
    winner = 0
    (ary.length - 1).times do |person| hand_ary[person, 0] = [ary[person][turn]] end
    result = lose_hantei(hand_ary)
    (ary.length - 1).times do |person|
      ary[person, 1] = [[nil]] if (ary[person])[turn] == result
      if (ary[person][turn] != result) && ary[person][turn]
        number_of_winner += 1
        winner = person 
      end
    end
    return [turn, winner] if number_of_winner == 1
  end
  return [-1, -1]
end

def lose_hantei(hand_ary)
  hantei = 0
  hantei += 1 if hand_ary.find{ |ele| ele == :rock}
  hantei += 2 if hand_ary.find{ |ele| ele == :scissors}
  hantei += 4 if hand_ary.find{ |ele| ele == :paper}
  if hantei == 1 || hantei == 2 || hantei == 4 || hantei == 7 then return :draw #引き分け
  elsif hantei == 3 then return :scissors #グーが勝ち
  elsif hantei == 6 then return :paper #チョキが勝ち
  elsif hantei == 5 then return :rock #パーが勝ち
  else return nil end #配列がおかしいときはnilを返す（全員の手がnilとか）
end