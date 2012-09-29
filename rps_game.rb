def rps_game(ary)
	max = 0
	ary.each do |personAry|
		max = personAry.length if max <= personAry.length
	end
	(0..(max - 1)).each do |turn| #何ターン目か
		handAry = []
		(0..(ary.length - 1)).each do |person|
			if turn < ary[person].length then handAry[person, 0] = [(ary[person])[turn]]
			else handAry[person, 0] = [nil]	end
		end
		result, finish, winner, nanninme = win_hantei(handAry), 0, 0, 0
		(0..(handAry.length - 1)).each do |person|
			finish, winner = finish+1, person if !(handAry[person] == result) && handAry[person]
			return [turn, winner] if finish == 1 && (person >= (handAry.length - 1))
		end
	end
	return [-1, -1]
end

def win_hantei(handAry)
	hantei = 0
	hantei += 1 if handAry.find{ |ele| ele == :rock}
	hantei += 2 if handAry.find{ |ele| ele == :scissors}
	hantei += 4 if handAry.find{ |ele| ele == :paper}
	if hantei == 1 || hantei == 2 || hantei == 4 || hantei == 7 then return :draw #引き分け
	elsif hantei == 3 then return :scissors #グーが勝ち
	elsif hantei == 6 then return :paper #チョキが勝ち
	elsif hantei == 5 then return :rock #パーが勝ち
	else return nil end #配列がおかしいときはnilを返す（全員の手がnilとか）
end
