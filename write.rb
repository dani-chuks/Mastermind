require "json"
class Write 
  def self.writer(player_name,game_time)
    former = []
      if File.exists?"top_scores.json"
       file = File.open "top_scores.json", "r"
       if !File.zero?"top_scores.json"
         #scoreHash = JSON.parse file.read
         json = File.read('top_scores.json')
          former = JSON.parse(json)
       end
       file.close
       File.delete("top_scores.json")
     end
     obj = [
       {"name"=>player_name,"time"=>game_time}
     ]
     new_obj = former + obj
     sorted = new_obj.sort_by { |k| k[:time]}
     if sorted.count > 10
       sorted.pop
     end
     puts "======TOP SCORES====="
     sorted.each do |a|
       puts "#{a["name"]} ====== #{a["time"]} "
     end
     f = File.new("top_scores.json","w")
    f.close
    File.open("top_scores.json","w") do |f|
    f.puts JSON.pretty_generate(sorted)
   end
  end
end