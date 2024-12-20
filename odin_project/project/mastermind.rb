class Mastermind
  COLORS = ["red", "blue", "green", "yellow", "orange", "purple"] # 6 farklı renk tanımlanır.
  
  def initialize
    @code = COLORS.sample(4) # 4 renkli rastgele kombinasyon oluşturulur.
    @attempts = 12 # Toplam 12 tahmin hakkı verilir.
    puts "Mastermind oyununa hoş geldiniz!"
    puts "6 renk var: #{COLORS.join(', ')}"
    puts "4 renkli kombinasyonu bulmak için toplam 12 şansınız var!"
  end

  def player_guess
    puts "Lütfen 4 renkli bir kombinasyon tahmin edin (örnek: 'red blue green yellow'):"
    guess = gets.chomp.split.map(&:downcase) # Kullanıcının girdiği tahmin alınır ve split edilir.
    until valid_guess?(guess) # Geçerli olup olmadığını kontrol eder.
      puts "Geçersiz tahmin! Lütfen geçerli bir kombinasyon girin (örnek: 'red blue green yellow'):"
      guess = gets.chomp.split.map(&:downcase)
    end
    guess # Doğru tahmin alınır.
  end

  def valid_guess?(guess)
    guess.length == 4 && (guess - COLORS).empty? # 4 renkli giriş ve kullanılan renklerden olup olmadığı kontrol edilir.
  end

  def check_guess(guess)
    correct_positions = 0 # Doğru konumdaki renklerin sayısı
    correct_colors = 0 # Renklerin doğru ama konumun yanlış olduğu sayı
    @code.each_with_index do |color, index|
      if guess[index] == color # Doğru konumda renk
        correct_positions += 1
      elsif @code.include?(guess[index]) # Renk doğru ama konum yanlış
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
    until game_over?({ correct_positions: 0, correct_colors: 0 }) # Oyun bitene kadar tahmin alınır.
      guess = player_guess
      results = check_guess(guess)
      @attempts -= 1 # Her tahminde kalan tahmin hakkı azalır.
      puts "Kalan tahmin hakkı: #{@attempts}" # Kalan tahmin hxakkı gösterilir.
    end
  end
end

game = Mastermind.new
game.play
