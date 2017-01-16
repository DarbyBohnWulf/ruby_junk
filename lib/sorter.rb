class Sorter
  def self.bubble_sort(numbers)
    swapped = true
    until !swapped
      swapped = false
      (numbers.length - 1).times do |n|
        if numbers[n] > numbers[n+1]
          numbers[n],numbers[n+1] = numbers[n+1],numbers[n]
          swapped = true
        end
      end
    end
    numbers
  end

  def self.bubble_sort_by(array,&rules)
    swapped = true
    until !swapped
      swapped = false
      (array.length - 1).times do |n|
        if (yield array[n], array[n+1]) > 0
          array[n],array[n+1] = array[n+1],array[n]
          swapped = true
        end
      end
    end
    array
  end
end
