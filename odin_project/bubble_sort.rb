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

result = bubble_sort([4, 3, 78, 2, 0, 2])
puts "Sıralanmış dizi: #{result}"
