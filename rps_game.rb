def rps_game(ary)
	max,nanninme = 0,0
	ary.each do |personAry|
		if max <= personAry.length
			max = personAry.length
		end
	end
	(0..(max - 1)).each do |turn| #何ターン目か
		handAry = []
		put_into_handAry(ary, handAry, nanninme, turn)
		result = win_hantei(handAry)
		handAry.each do |hand|
			if hand == result
				ary[nanninme, 1] = [[nil]]
			end
			nanninme += 1
		end
		handAry = []
		nanninme = put_into_handAry(ary, handAry, nanninme, turn)
		p nanninme
		finish, winner = 0,0
		handAry.each do |hand|
			if hand
				finish += 1
				winner = nanninme
			end
			if finish == 1 && (nanninme >= (handAry.length - 1))
				return [turn, winner]
			end
			nanninme += 1
		end
	end
	return [-1, -1]
end

def win_hantei(handAry)
	hantei = 0
	if handAry.find{ |ele| ele == :rock} 
		hantei += 1 
	end
	if handAry.find{ |ele| ele == :scissors}
		hantei += 2
	end
	if handAry.find{ |ele| ele == :paper}
		hantei += 4
	end
	if hantei == 1 || hantei == 2 || hantei == 4 || hantei == 7
		return :draw #引き分け
	elsif hantei == 3
		return :scissors #グーが勝ち
	elsif hantei == 6
		return :paper #チョキが勝ち
	elsif hantei == 5
		return :rock #パーが勝ち
	else return nil #配列がおかしいときはnilを返す（全員の手がnilとか）
	end
end

def put_into_handAry(ary, handAry, nanninme, turn)
	nanninme = 0
	ary.each do |personAry| #それぞれの人の手を
		if personAry[0]
			handAry[nanninme, 0] = [personAry[turn]]
		else
			handAry[nanninme, 0] = [nil]
		end
		nanninme += 1
	end
	0
end
rps_game([[:rock],[:rock]])
