# Fibonacci Dizisi - Yinelemeli
def fibs(n)
  fib_sequence = [0, 1]
  (2...n).each do |i|
    fib_sequence << fib_sequence[i - 1] + fib_sequence[i - 2]
  end
  fib_sequence[0...n]
end

# Fibonacci Dizisi - Özyinelemeli
def fibs_rec(n, sequence = [0, 1])
  puts 'This was printed recursively' # Yineleme etkisini görmek için
  return sequence[0...n] if sequence.size >= n
  sequence << sequence[-1] + sequence[-2]
  fibs_rec(n, sequence)
end

# Birleştirme Sıralaması (Merge Sort)
def merge_sort(array)
  return array if array.length <= 1

  mid = array.length / 2
  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..])

  merge(left, right)
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end

puts "Fibonacci (yinelemeli): #{fibs(8).inspect}"
puts "Fibonacci (özyinelemeli): #{fibs_rec(8).inspect}"
puts "Merge Sort: #{merge_sort([3, 2, 1, 13, 8, 5, 0, 1]).inspect}"
puts "Merge Sort: #{merge_sort([105, 79, 100, 110]).inspect}"
