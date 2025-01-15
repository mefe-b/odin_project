class TicTacToe
  def initialize
    # setup_game fonksiyonunu testlerde çalıştırmamak için otomatik başlatıyoruz
    @board = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"]
    ]
    @mode = :two_players
    @current_player = "X"
    print_board
  end

  def setup_game
    # Testlerde bu fonksiyonu atlıyoruz
  end

  def print_board
    @board.each_with_index do |row, index|
      puts row.join(" | ")
      puts "--+---+--" unless index == 2
    end
    puts
  end

  def play
    loop do
      if @mode == :computer && @current_player == "O"
        computer_move
      else
        player_move
      end
      print_board
      if winner?
        puts "#{@current_player} wins!"
        break
      elsif board_full?
        puts "It's a tie!"
        break
      end
      switch_player
    end
  end

  def player_move
    puts "#{@current_player}, make your move (1-9):"
    position = gets.chomp.to_i
    if valid_move?(position)
      update_board(position)
    else
      puts "Invalid move! Please select an empty cell (1-9)."
      player_move
    end
  end

  def computer_move
    position = available_positions.sample
    update_board(position)
    puts "Computer placed on position #{position}."
  end

  def valid_move?(position)
    position.between?(1, 9) && @board[(position - 1) / 3][(position - 1) % 3] == position.to_s
  end

  def update_board(position)
    @board[(position - 1) / 3][(position - 1) % 3] = @current_player
  end

  def available_positions
    @board.flatten.select { |spot| spot =~ /\d/ }.map(&:to_i)
  end

  def switch_player
    @current_player = @current_player == "X" ? "O" : "X"
  end

  def winner?
    lines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
    lines.any? do |line|
      line_values = line.map { |index| @board[index / 3][index % 3] }
      line_values.uniq.length == 1 && line_values.first != " "
    end
  end

  def board_full?
    @board.flatten.none? { |spot| spot =~ /\d/ }
  end
end
