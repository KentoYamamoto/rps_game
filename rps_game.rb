def rps_game(ary)
	(0..(ary[0].length - 1)).each do |num| #何回目の手か
	#	p num
		handAry = []
		nanninme = 0
		ary.each do |personAry| #それぞれの人の手を
			handAry[nanninme, 0] = [[personAry[num], nanninme]]
			nanninme = nanninme + 1
		end
		p handAry
	end
end

rps_game([[:rock,:paper,:rock],[:rock,:rock,:scissors]])
