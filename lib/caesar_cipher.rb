class CaesarCipher
  def initialize(shift)
    @shift = shift
  end

  def encode(text)
    text.chars.map do |char|
      if char =~ /[A-Za-z]/
        base = char.upcase == char ? 'A'.ord : 'a'.ord
        ((char.ord - base + @shift) % 26 + base).chr
      else
        char
      end
    end.join
  end

  def decode(text)
    text.chars.map do |char|
      if char =~ /[A-Za-z]/
        base = char.upcase == char ? 'A'.ord : 'a'.ord
        ((char.ord - base - @shift) % 26 + base).chr
      else
        char
      end
    end.join
  end
end

text = "That was who I am."
shift = 3

cipher = CaesarCipher.new(shift)
encrypted = cipher.encode(text)
puts encrypted
