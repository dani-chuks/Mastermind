require_relative "computer"
require_relative "messages"
require_relative "Player"

class Game
	require "computer"
	def self.game_flow
		@message.introductory_message
		players_decision = gets.chomp.downcase
		if players_decision == "i"
			Message.game_instruction
			players_decision = gets.chomp
			def self.game_flow
			Message.introductory_message
			players_decision = ""
			while players_decision != "q"
		    	players_decision = gets.chomp.downcase
		    	case players_decision
		       	 when "i"
		            Message.game_instruction
		         when "q"
		            break
		         when "p"
		            self.play
		         else
		            puts "Enter right input"
		         end
		 	end
	end

	def self.play
		@comp_code = Computer.secret_code
		@players_try = Player.guess
		match = matches_array(@players_try, @comp_code)
		partial = partial_array(@players_try, @comp_code)
		incorrect_entries = 
		count = 0
		while i < 12 && match.length != 4
			count += 1
			puts "You entered #{@players} which has #{match.length} perfect matches, #{partial.length} near mathes with #{incorrect_entries}incorrect entries!"
		end
	end
	def self.matches_array(my_choice, comp_choice)
		@compare = comp_choice.zip(my_choice)
		matches = []
		@compare.collect do |i|
			if i[0] == i[1]
				matches << i[0]
			end
		end
		return matches
	end

	def partial_array(my_choice, comp_choice)
		@compare = comp_choice.zip(my_choice)
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