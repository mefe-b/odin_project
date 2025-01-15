require_relative '../lib/tic_tac_toe'

RSpec.describe TicTacToe do
  let(:game) { TicTacToe.new }
  
  before do
    # setup_game fonksiyonunu geçici olarak atlıyoruz
    game.instance_variable_set(:@board, [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"]
    ])
    game.instance_variable_set(:@current_player, "X")
  end

  describe '#initialize' do
    it 'sets up the game with the correct initial state' do
      expect(game.instance_variable_get(:@board)).to eq([
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
      ])
      expect(game.instance_variable_get(:@mode)).to eq(:two_players)
      expect(game.instance_variable_get(:@current_player)).to eq("X")
    end
  end

  describe '#valid_move?' do
    it 'returns true for a valid move' do
      expect(game.valid_move?(1)).to be true
      expect(game.valid_move?(5)).to be true
    end

    it 'returns false for an invalid move' do
      game.update_board(1)
      expect(game.valid_move?(1)).to be false
    end
  end

  describe '#update_board' do
    it 'updates the board with the current player' do
      game.update_board(1)
      expect(game.instance_variable_get(:@board)[0][0]).to eq("X")
    end
  end

  describe '#switch_player' do
    it 'switches the current player from X to O' do
      expect { game.switch_player }.to change { game.instance_variable_get(:@current_player) }.from("X").to("O")
    end

    it 'switches the current player from O to X' do
      game.switch_player
      expect { game.switch_player }.to change { game.instance_variable_get(:@current_player) }.from("O").to("X")
    end
  end

  describe '#available_positions' do
    it 'returns an array of available positions' do
      expect(game.available_positions).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
      game.update_board(1)
      expect(game.available_positions).to eq([2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#winner?' do
    it 'returns true if there is a winning line' do
      game.update_board(1)
      game.switch_player
      game.update_board(4)
      game.switch_player
      game.update_board(2)
      game.switch_player
      game.update_board(5)
      game.switch_player
      game.update_board(3)
      expect(game.winner?).to be true
    end

    it 'returns false if there is no winner' do
      expect(game.winner?).to be false
    end
  end

  describe '#board_full?' do
    it 'returns true if the board is full' do
      game.update_board(1)
      game.update_board(2)
      game.update_board(3)
      game.update_board(4)
      game.update_board(5)
      game.update_board(6)
      game.update_board(7)
      game.update_board(8)
      game.update_board(9)
      expect(game.board_full?).to be true
    end

    it 'returns false if the board is not full' do
      expect(game.board_full?).to be false
    end
  end
end
