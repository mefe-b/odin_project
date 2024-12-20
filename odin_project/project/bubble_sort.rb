def bubble_sort(list)
  size = list.length

  loop do
    swapped = false

    (size - 1).times do |index|
      if list[index] > list[index + 1]
        list[index], list[index + 1] = list[index + 1], list[index]
        swapped = true
      end
    end

    break unless swapped
  end

  list
end

numbers = [5, 3, 8, 4, 2]
sorted_numbers = bubble_sort(numbers)