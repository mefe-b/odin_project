def substrings(words, dictionary)
  words = [words] unless words.is_a?(Array)  # Eğer words bir dizi değilse, onu diziye dönüştür
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
