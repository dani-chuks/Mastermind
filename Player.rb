require "colorize"
class Player
    def self.guess
		player_guess = gets.chomp.upcase.split("")
		return player_guess
	end
	def self.name
		player_name = gets.chomp.upcase.to_s
		return player_name
	end

	def self.level
		player_level = gets.chomp
		return player_level
	end
end
#level hash = {1 => 4, 2 => 5, 3 => 6}