require "colorize"
class Computer
  def self.secret_code(num)
    if num == 4
      colors = ["B", "R", "G","Y"]
    end
    if num == 5
      colors = ["B", "R", "G","Y","M"]
    end
    if num == 6
      colors = ["B", "R", "G","Y","M", "W"]
    end
    sample_code = []
    num.times do 
      sample_code << colors.shuffle[0]
    end
    sample_code
  end
end