class EvaluateScore
	
	def self.filename(level)
		level  = gets.chomp
		if level == 1
			filename = "beginner.txt"
		end
		if level == 2
			filename = "intermediate.txt"
		end
		if level == 3
			filename == "Advanced.txt"
		end
		return filename
	end

	def self.record_perfomance(name, time, count,filename)
		File.open("#{filename}", "a+" ){|i| i.puts "#{name} - #{elapsed_time} - #{count}"}
	end

	def self.show_top_ten(filename,level)
		if File.exist?(filename) 
			puts "Sorry no one has won so far, be the first"
		else
			f = 

def 
