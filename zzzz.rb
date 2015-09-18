require 'pry'
require_relative "computer"
require_relative "Player"
require_relative "messages"
require_relative "write"
require "colorize"
class Game
  def initialize
    @game = Game.new
  end
  
  def self.game_flow
    players_decision = ""
    Message.introductory_message
    while players_decision != "q"
      players_decision = gets.chomp.downcase
      if players_decision == "i"
        Message.game_instruction
      end
      if players_decision == "p"
        play
      end
    end
  end

  def self.play
    Message.choose_level
    level_hash = {1 => 4, 2 => 5, 3 => 6}
    while
      level = Player.level
      if (level == 1.to_s || level == 2.to_s || level == 3.to_s) && level.length == 1
        break
      else 
        puts "Enter either 1, 2,or 3".red
        next
      end
    end
    puts "You are now playing level " + level.to_s
    level = level.to_i
    if level == 1
      Message.game_beginner
    end
    if level == 2
      Message.intermediate
    end
    if level == 3
      Message.advanced
    end
    comp_code = Computer.secret_code(level_hash[level])
    count = 0
    start_time = Time.now
    win = false
    file = []
    cheat_status = false
    while count < 12 
      cheat_status = false
      puts "Whats your guess".green
      players_try = Player.guess
      count += 1
      if players_try == ["C"]
        count -= 1
        cheat_status = true
        puts "You are some badass cheat".green
        puts "Secret code is #{comp_code.join.magenta}"
        cheat_status = true
      end
      if players_try == ["Q"]
        puts "Sorry quitter you are leaving after #{count} chance(s)".yellow
        win = true
        break
      end
      if players_try.length != level_hash[level] && cheat_status == false
        count -= 1
        puts "You have entered an invalid entry".red
      end
      match = matches_array(comp_code, players_try)
      partial = partial_array(comp_code, players_try)
      incorrect_entries = players_try.length - match.length - partial.length
      if match == comp_code && players_try.length == level_hash[level]
        elapsed_time = Time.now - start_time
        puts "Congratulations!! #{name} you broke the code after #{count} chance(s) in #{elapsed_time} secs".yellow
        win = true
        puts "Enter your name".green
        name = Player.name
        Write.writer(name, elapsed_time)
        break
      end
      if cheat_status == false
        puts "You entered #{@players_try} which has #{match.length} perfect matches, #{partial.length} near mathes with #{incorrect_entries} incorrect entries from #{count} tries"
      end
      "Whats your guess"
    end
    if win == false
      puts "You lost!! The secret code was "  + comp_code.join("").green
    end
    game_decision
  end

  def self.game_decision
    puts "Would you like to play again or check top score? Enter p to play q to quit"
    players_decision = ''
    while players_decision != ""
      if players_decision == "P"
          game_flow
      elsif players_decision == "Q"
        break
      elsif players_decision == "I"
        Write.writer
      elsif players_decision != "P" && players_decision != "Q"
        puts "Enter correct input"
        players_decision = gets.chomp
      end
      
    end
  end

  def self.matches_array(comp_choice,my_choice)
    @compare = comp_choice.zip(my_choice) #creates an array containing arrays as elements ie @compare = [[my_choice], [comp_choice]]
    match = [] #initializes an empty array for the matches
    @compare.select{|i| match << i[0] if i[0] == i[1]}
    return match
  end
  def self.partial_array(comp_choice, my_choice)
    @compare = comp_choice.zip(my_choice)
    pcomp_code = []
    pplayers_code = []
    @compare.each{|i| pcomp_code << i[0] if i[0] != i[1]}
    @compare.each{|i| pplayers_code << i[1] if i[0] != i[1]}
    partial_match = []
    for i in pplayers_code
      if pcomp_code.include?i
        pcomp_code.delete_at(pcomp_code.index(i))
        partial_match << i
      end
    end
    partial_match
  end

end