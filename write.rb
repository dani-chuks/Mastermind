require "json"
class Write 
  def self.writer(player_name,game_time, level)
    initial = []
      if File.exists?"#{level}.json"
       file = File.open "#{level}.json", "r"
       if !File.zero?"top_scores.json"
         #scoreHash = JSON.parse file.read
         json = File.read("#{level}.json")
          initial = JSON.parse(json)
       end
       file.close
       File.delete("#{level}.json")
     end
     obj = [
       {"name"=>player_name,"time"=>game_time}
     ]
     new_obj = initial + obj
     sorted = new_obj.sort_by { |k| k[:time]}
     if sorted.count > 10
       sorted.pop
     end
     puts "*****TOP SCORES*** level #{level}**"
     sorted.each do |a|
       puts "#{a["name"]} ====== #{a["time"]} "
     end
     f = File.new("#{level}.json","w")
    f.close
    File.open("#{level}.json","w") do |f|
    f.puts JSON.pretty_generate(sorted)
   end
  end
end