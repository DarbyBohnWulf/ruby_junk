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
      matches == self.length ? true : false
    else
      self.my_select {|s| !s.nil?} == self ? true : false
    end
  end

  def my_any?
    if block_given?
      self.my_each {|s| if (yield s) then return true end}
    else
      self.my_each {|s| if !(s.nil?) then return true end}
    end
  end

  def my_none?
    if block_given?
      self.my_each {|s| if (yield s) then return false end}
      true
    else
      self.my_each {|s| if !(s.nil?) then return false end}
      true
    end
  end

  def my_count
    counted = 0
    if block_given?
      counted = self.my_select { |s| yield s }.length
    else
      counted = self.my_select { |s| !s.nil? }.length
    end
  end

  def my_map(*procs)
    if procs[0].is_a?(Proc)
      result = []
      self.my_each { |s| result.push procs[0].call s}
      result
    elsif block_given?
      result = []
      self.my_each { |s| result.push yield s}
      result
    else
      self.to_enum
    end
  end

  def my_inject(*initial, &binary)
    initial.empty? ? result = self[0] : result = initial[0]
    (self.size - 1).times do |s|
      result = yield result,self[s + 1]
    end
    result
  end

  def self.multiply_els(array)
    array.my_inject { |prod,s| prod*s }
  end
end
