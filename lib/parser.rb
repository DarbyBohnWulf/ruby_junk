class Parser
  def self.substrings(string, dictionary)
    results = Hash.new
    dictionary.each do |d|
      if string[d]
        if results.has_key?(d)
          results[d] += 1
        else
          results[d] = 1
        end
      else

      end
    end
    results
  end
end
