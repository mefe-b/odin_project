class TicTacToe
  # initialize metodu, oyunu başlatır ve başlangıç kurulumu yapar.
  def initialize
    setup_game           # Oyun ayarlarını yap
    # Tahtayı başlatır, başlangıç değerleri atanır.
    @board = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"]
    ]
    print_board           # Tahtayı başlatılmış halini yazdır
  end

  # Oyunun başlama modunu seçmek için bir yöntem
  def setup_game
    puts "Select game mode:"  # Kullanıcıya oyun modunu seçmesi için bilgi verilir
    puts "1 - Two Players"
    puts "2 - Play Against Computer"
    mode = gets.chomp.to_i
    @mode = mode == 2 ? :computer : :two_players

    # Rastgele başlatıcı olarak "X" veya "O" seçilir ve başlangıç mesajı yazdırılır
    @current_player = rand(2).zero? ? "X" : "O"
    puts "#{@current_player} starts the game!"
  end

  # Tahtayı ekrana yazdıran metod
  def print_board
    @board.each_with_index do |row, index|
      puts row.join(" | ")  # Tahtayı satır satır yazdır
      puts "--+---+--" unless index == 2  # Son satırda sınır çizgisi yazma
    end
    puts
  end

  def play
    loop do
      if @mode == :computer && @current_player == "O"
        computer_move  # Bilgisayarın hamlesi yapılır
      else
        player_move    # Oyuncunun hamlesi yapılır
      end

      print_board  # Tahtayı her hamleden sonra yazdır

      if winner?  # Kazanan kontrol edilir
        puts "#{@current_player} wins!"
        break
      elsif board_full?  # Tahtanın dolup dolmadığı kontrol edilir
        puts "It's a tie!"  # Eşitlik durumu (beraberlik) kontrol edilir
        break
      end

      switch_player  # Sıra değişir
    end
  end

  # Oyuncunun yaptığı hamleyi alır ve tahtayı günceller
  def player_move
    puts "#{@current_player}, make your move (1-9):"
    position = gets.chomp.to_i  # Kullanıcının hamlesi alınır

    if valid_move?(position)  # Hamlenin geçerli olup olmadığını kontrol eder
      update_board(position)  # Tahtayı hamleye göre günceller
    else
      puts "Invalid move! Please select an empty cell (1-9)."  # Hatalı hamle, tekrar hamle isteme
      player_move  # Tekrar hamle yap
    end
  end

  # Bilgisayarın rastgele hamle yaptığı metod
  def computer_move
    position = available_positions.sample  # Boş pozisyonlardan rastgele bir seçim yapılır
    update_board(position)  # Tahtayı güncelle
    puts "Computer placed on position #{position}."  # Bilgisayarın yaptığı hamle yazdırılır
  end

  # Hamlenin geçerli olup olmadığını kontrol eder
  def valid_move?(position)
    position.between?(1, 9) && @board[(position - 1) / 3][(position - 1) % 3] == position.to_s
    # Tahtada boş olan ve geçerli bir konum olup olmadığını kontrol eder
  end

  # Tahtayı güncelleyen metod
  def update_board(position)
    @board[(position - 1) / 3][(position - 1) % 3] = @current_player
    # Seçilen pozisyonda oyuncunun simgesini (X veya O) tahtaya yaz
  end

  # Boş pozisyonları bulur ve listeler
  def available_positions
    @board.flatten.select { |spot| spot =~ /\d/ }.map(&:to_i)
    # Boş pozisyonları bulmak için taşan stringlerdeki rakamları alır
  end

  # Sıra değiştiren metod
  def switch_player
    @current_player = @current_player == "X" ? "O" : "X"
    # Oyuncunun sırayla X ve O arasında değişmesini sağlar
  end

  # Kazanan kontrol eden metod
  def winner?
    lines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],  # Satır kontrolleri
      [0, 3, 6], [1, 4, 7], [2, 5, 8],  # Sütun kontrolleri
      [0, 4, 8], [2, 4, 6]               # Diyagonal kontroller
    ]

    lines.any? do |line|
      line_values = line.map { |index| @board[index / 3][index % 3] }
      # Her bir kazanan satırın değerleri alınır ve kontrol edilir
      line_values.uniq.length == 1 && line_values.first != " "
    end
  end

  # Tahtanın tamamen dolup dolmadığını kontrol eder
  def board_full?
    @board.flatten.none? { |spot| spot =~ /\d/ }
    # Boş hücre kalmadığı kontrol edilir
  end
end

# TicTacToe sınıfı instance'ı oluşturulur ve oyunun başlaması sağlanır.
game = TicTacToe.new
game.play
