class Mastermind
  COLORS = ["red", "blue", "green", "yellow", "orange", "purple"] 
  
  def initialize
    @code = COLORS.sample(4) 
    @attempts = 5
    puts "Mastermind oyununa hoş geldiniz!"
    puts "6 renk var: #{COLORS.join(', ')}"
    puts "4 renkli kombinasyonu bulmak için toplam 12 şansınız var!"
  end

  def player_guess
    puts "Lütfen 4 renkli bir kombinasyon tahmin edin (örnek: 'red blue green yellow'):"
    guess = gets.chomp.split.map(&:downcase) 
    until valid_guess?(guess)
      puts "Geçersiz tahmin! Lütfen geçerli bir kombinasyon girin (örnek: 'red blue green yellow'):"
      guess = gets.chomp.split.map(&:downcase)
    end
    guess
  end

  def valid_guess?(guess)
    guess.length == 4 && (guess - COLORS).empty?
  end

  def check_guess(guess)
    correct_positions = 0
    correct_colors = 0
    
    @code.each_with_index do |color, index|
      if guess[index] == color 
        correct_positions += 1
      elsif @code.include?(guess[index]) 
        correct_colors += 1
      end
    end
    
    puts "#{correct_positions} doğru renk ve doğru konum, #{correct_colors} doğru renk ama yanlış konum!"
    { correct_positions: correct_positions, correct_colors: correct_colors }
  end

  def game_over?(results)
    if results[:correct_positions] == 4
      puts "Tebrikler! Tüm renk kombinasyonunu doğru buldunuz!"
      true
    elsif @attempts == 0
      puts "Üzgünüm, tüm tahmin haklarını kullandınız. Doğru kombinasyon: #{@code.join(' ')}"
      true
    else
      false
    end
  end

  def play
    until game_over?({ correct_positions: 0, correct_colors: 0 })
      guess = player_guess
      results = check_guess(guess)
      @attempts -= 1 
      # puts "Kalan tahmin hakkı: #{@attempts}"
      if @attempts == 3
        puts "3 hakkınız kalmıştır!"
      else
        puts "devam edin"
      end
    end
  end  
end


game = Mastermind.new
game.play
