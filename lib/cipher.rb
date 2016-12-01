class Cipher
  def self.caesar_cipher(raw_string, shift_increment)
    raw_integers = raw_string.split("").collect {|c| c.ord}
    coded_string = ""
    raw_integers.each do |i|
      if i < 65
        i
      elsif i > 90
        i + shift_increment > 122 ? i = i + shift_increment - 26 : i += shift_increment
      else
        i + shift_increment > 90 ? i = i + shift_increment - 26 : i += shift_increment
      end
      coded_string += i.chr
    end
    coded_string
  end
end
