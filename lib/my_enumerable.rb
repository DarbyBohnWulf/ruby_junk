module Enumerable
  def my_each
    if block_given?
      self.size.times {|m| yield self[m]}
      self
    else
      self.to_enum
    end
  end

  def my_each_with_index
    if block_given?
      self.size.times {|m| yield m,self[m]}
      self
    else
      self.to_enum
    end
  end

  def my_select
    if block_given?
      result = []
      self.my_each do |s|
        if yield s
          result.push s
        else
        end
      end
      result
    else
      self.to_enum
    end
  end

  def my_all?
    matches = 0
    if block_given?
      until !yield self[matches]
        matches += 1
      end
      matches == self.length ? true : false    else
      self.my_select {|s| !s.nil?} == self ? true : false
    end
  end
end
