class Cipher
  def self.caesar_cipher(raw_string, shift_increment)
    raw_integers = raw_string.split("").collect {|c| c.ord}
    coded_string = ""
    raw_integers.each do |i|
      i += shift_increment
      coded_string += i.chr
    end
    coded_string
  end
end
