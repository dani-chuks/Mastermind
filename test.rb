class Game
	def play
		12.times do |i|
			
	end
	def matches_array
		@comp_code = ["W","P","K","O","P"]
		@players_try = ["W", "F","P","O","P"]
		@compare = @comp_code.zip(players_try)
		matches = []
		compare.collect do |i|
			if i[0] == i[1]
				matches << i[0]
			end
		end
		return matches
	end

	def partial_array
		pcomp_code = []
		remaining_comp_code = @compare.collect do |i|
			pcomp_code << (i[0] - i[1])
		end
		pplayers_try = []
		remaining_players_try = @compare.collect do |i|
			pplayers_try << (i[0] - i[1])
		end
		partial_matches = []
		partial_matches = remaining_players_try.select do|i|
			if remaining_comp_code.include?i
				partial << i
				remaining_comp_code = remaining_comp_code.delete_at(remaining_comp_code.index(i))
			end
		end
		return partial_matches
	end
end