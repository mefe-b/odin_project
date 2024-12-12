def caesar_cipher(text, shift)
  encrypted_text = text.chars.map do |char|

    if char =~ /[A-Za-z]/
      base = char.upcase == char ? 'A'.ord : 'a'.ord
      new_char = ((char.ord - base + shift) % 26 + base).chr
    else 
      char
    end
  end
  encrypted_text.join
end

text = "That was who I am?"
shift = 35

encrypted = caesar_cipher(text, shift)
puts encrypted
