class Board

  def initialize (rows, cols)
    @board = Array.new
    for i in 0..rows-1
      row = Array.new
      for j in 0..cols-1
        row.push('[_]')
      end
      @board.push(row)
    end
  end

  def board # returns current board
    @board
  end

  def show_board # prints current tic-tac-toe board!
    @board.each do |row|
      print row
      puts
    end
  end

  def modify_board(pos, sign)
    @board[pos[0]][pos[1]] = "[#{sign}]"
  end

end

class Player
  def initialize
    print "Choose a sign(X or O): "
    sign = gets.chomp.upcase
    @sign = sign
    @name = "Player#{@sign}"
  end

  def name #name getter
    @name
  end

  def sign #sign getter
    @sign
  end

  def add_move
    print "Enter position to enter #{self.sign.upcase} in(row): "
    row = gets.chomp.downcase.to_i
    print "Enter position to enter #{self.sign.upcase} in(column): "
    column = gets.chomp.downcase.to_i
    [row,column]
  end


end

=begin
class Game
  def initialize
    @new_board = Board.new(3,3)
    @player1 = Player.new
    @player2 = Player.new
    while(!@new_board.win?)

    end
  end

  def get_board
    @new_board
  end

  def win?
    # 9 possible win scenarios
    to_return = false

  end

end
=end

new_board = Board.new(3,3)
#puts new_board.board.inspect
new_board.show_board
player1 = Player.new
player2 = Player.new
new_board.modify_board(player1.add_move, player1.sign)
new_board.show_board
new_board.modify_board(player2.add_move, player2.sign)
new_board.show_board
