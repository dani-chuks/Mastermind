require_relative "Player"
require_relative "zzzz"
require_relative "computer"
require "colorize"
class Message
	def initialize
		@game = Game.new
	end
	def self.choose_level
		puts"I have created the game to be played at three different levels. level 1 for \nbeginner, 2 for intermediate and 3 for Advanced level. \nStart by choosing the level you would like to play"
		puts "Enter your level".green
	end
	def self.introductory_message
		puts "Welcome to MASTERMIND. A game which test how well you can break a code which \nrepresents a sequence of the first letters of colors. Would you like to play?\n Hit  to p (p)lay,i to read the (i)nstructions, or (q)uit?".green
	end

	def  self.game_instruction
		puts "MasterMind is a code breaking in which the player known as code breaker is expected to predict the sequence of colours presented by the secret code maker. Enter to p play or q to quit".yellow
	end

	def self.game_beginner
		puts "A sequence has been generated with four elements made up of: #{"(r)ed".red},\n#{"(g)reen".green}, #{"(b)lue".blue}, and #{"(y)ellow".yellow}.\n Use (q)uit at any time to end the game"
	end

	def self.in_game_feedback
		puts "#{Player.guess} has #{Game.matches_array(Player.guess, Computer.secret_code).length} perfect matches with #{Game.matches_array(Player.guess, Computer.secret_code).length}"
	end

	def self.end_game
		puts "You guessed the sequence #{Player.guess}.Do you want to (p)lay again or (q)uit?"
	end

	def self.intermediate
		puts "You have selected intermediate level. You are provided with six colors from which five will be taken #{'(y)ellow'.yellow}, #{'(r)ed'.red}, #{'(b)lue'.blue}, #{'(g)reen'.green} and #{'(m)agenta'.magenta}.Enter the sequence of the selected five colors."
	end

	def self.advanced
		puts "You have selected intermediate level. You are provided with six colors\n #{'(y)ellow'.yellow}, #{'(r)ed'.red}, #{'(b)lue'.blue}, #{'(g)reen'.green}, #{'(m)agenta'.magenta} and white.You are expected to guess a sequence of five letters where each letter can be  from any of the six colours given"
	end
end
