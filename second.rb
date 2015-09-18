class Encryptor
  def cipher
    @comparator = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    return @comparator
  end

  def encrypt(arr, moves)
    arr = arr.split("")
    @product = []
    for i in arr
      @product << @comparator.index(i) + moves
    end
    answer = (@product.collect{|a| a })#.join(",")
    empty = []
    for i in answer
      if i <= 25
        empty << i
      else
        empty << i - 26
      end
    end
    modified_string = empty.collect{|i| @comparator[i]}.join("")
    return modified_string
  end

  def decrypt(arr, moves)
    arr = arr.split("")
    @comparator = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    @product = []
    for i in arr
      @product << @comparator.index(i) - moves
    end
    index_of_array = (@product.collect{|a| a })#.join(",")
    encrypted_string = []
    for i in index_of_array
      if i >= 0
        encrypted_string << i
      else
        encrypted_string << i + 26
      end
    end
    encrypted_string = encrypted_string.collect{|i| @comparator[i]}.join("")
    return encrypted_string
  end
end

