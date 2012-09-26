def rps_game(ary)
	max = 0
	ary.each do |pAry|
		if max <= pAry.length
			max = pAry.length
		end
	end
	(0..(max - 1)).each do |num| #何回目の手か
	#	p num
		handAry = []
		nanninme = 0
		ary.each do |personAry| #それぞれの人の手を
			handAry[nanninme, 0] = [personAry[num]]
			nanninme = nanninme + 1
		end
		p handAry
		rockFlag = handAry.find { |ele| ele == :rock }
		scissorsFlag = handAry.find { |ele| ele == :scissors }
		paperFlag = handAry.find { |ele| ele == :paper }
		if !(rockFlag || scissorsFlag || paperFlag) #ぜんぶにる
			return [-1, -1]
		end
#		elsif !(rockFlag && scissorsFlag && paperFlag)


	end
end

rps_game([[:rock,:paper,:rock, :paper],[:rock,:rock,:scissors],[:paper, :paper, :paper]])
#b = [1,1,1].find do |a| a == 2 end