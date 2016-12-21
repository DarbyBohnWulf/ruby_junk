class Parser
  def self.substrings(string, dictionary)
    results = {}
    words = string.split.collect.to_a
    words.each do |w|
      dictionary.each do |d|
        if w[d] && results.has_key?(d)
          results[d] = results[d] + 1
        elsif w[d]
          results[d] = 1
        else
        end
      end
    end

    results
  end
end
