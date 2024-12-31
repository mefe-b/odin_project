def substrings(words, dictionary)
  words = [words] unless words.is_a?(Array)
  words = words.map(&:downcase)  
  result = {}

  words.each do |word|
    dictionary.each do |substring|
      count = word.scan(substring).length
      result[substring] = result[substring].to_i + count if count > 0
    end
  end

  result
end

words = "hello world"
dictionary = ["hello", "world", "o", "ell"]

results = substrings(words, dictionary)
puts results

