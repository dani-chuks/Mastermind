require_relative "computer"
require_relative "Player"
require_relative "messages"
class Game
  def self.game_flow
    #@message.introductory_message
    players_decision = ""
      while players_decision != "q"
        players_decision = gets.chomp.downcase
        case players_decision
          when "i"
            Message.game_instruction
          when "p"
            self.play
          else
           puts "Enter right input"
         end
       end
     end
  def play
    players_try = gets.chomp.upcase.split("")
    comp_code = Computer.secret_code
    count = 0
    start_time = Time.now
    while count < 12 
      count += 1
      match = matches_array(@players_try, @comp_code)
      partial = partial_array(@players_try, @comp_code)
      guess_time = Time.now
      if match.length == comp_code
        final_time_mins = (guess_time - start_time).to_s + " Sec(s)"
        if final_time_mins > 60
          time_in_min = (guess_time - start_time).floor.to_s + " Min(s)"
          time_in_sec = (guess_time - start_time).round(4).to_s + " Sec(s)"
          final_time_mins = time_in_min + time_in_sec
          Message.end_game
          players_decision == gets.chomp.upcase
          while players_decision != ""
            if players_decision == "P"
              self.play
            elsif players_decision == "Q"
              break
            else
              puts "Enter correct input"
            end
          end
      puts "You entered #{@players_try} which has #{match.length} perfect matches, #{partial.length} near mathes with #{incorrect_entries}incorrect entries from #{count} tries"
      players_try = gets.chomp.upcase.split("")
    end
  end

  def matches_array(my_choice, comp_choice)
    @compare = comp_choice.zip(my_choice) #creates an array containing arrays as elements ie @compare = [[my_choice], [comp_choice]]
    matches = [] #initializes an empty array for the matches
    @compare.collect do |i|
      if i[0] == i[1]
        matches << i[0]
      end
    end
    return matches
  end

  def partial_array(my_choice, comp_choice)
    @compare = my_choice.zip(comp_choice)
    pcomp_code = []
    pplayers_code = []
    @compare.each{|i| pcomp_code << i[1] if i[0] != i[1]}
    @compare.each{|i| pplayers_code << i[0] if i[0] != i[1]}
    partial_match = partial_match = []
    for i in pplayers_code
      if pcomp_code.include?i
        pcomp_code.delete_at(pcomp_code.index(i))
        partial_match << i
      end
    end
    return partial_match.inspect
  end
end
me  = Game.new
#puts me.matches_array([1,2,3,6,2,4,], [1,5,3,2,6,2])
#puts me.partial_array([1,2,3,6,2,4], [1,5,3,2,6,2])