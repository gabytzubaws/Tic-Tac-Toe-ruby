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
    puts "-------------------"
    puts "----Tic-Tac-Toe----"
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

  def modify_board(pos, player)
    if @board[pos[0]][pos[1]] == '[_]'
       @board[pos[0]][pos[1]] = "[#{player.sign}]"
     else
       puts "That position is already filled! Try again"
       self.show_board
       self.modify_board(player.move, player)
     end
  end

  def win?
    current_board = self.board
    for i in 0..2 do
      if (current_board[i][0] != '[_]' && current_board[i][0] == current_board[i][1] && current_board[i][1] == current_board[i][2])
           return current_board[i][0]
      end
      if (current_board[0][i] != '[_]' && current_board[0][i] == current_board[1][i] && current_board[1][i] == current_board[2][i])
          return current_board[0][i]
      end
    end
    if (current_board[0][0] != '[_]' && current_board[0][0] == current_board[1][1] &&  current_board[1][1] == current_board[2][2])
      return current_board[0][0]
    end

    if current_board[0][0] != '[_]' && current_board[2][0] == current_board[1][1] && current_board[1][1] == current_board[0][2]
      return current_board[2][0]
    end
    return false
  end

end

class Player
  @@players_count = 0
  def initialize(sign)
    @@players_count += 1
    @count = @@players_count
    @sign = sign
    @name = "Player#{@count}"
    puts "Player#{@count} is playing with '#{@sign}'"
  end

  def name #name getter
    @name
  end

  def sign #sign getter
    @sign
  end

  def move
    print "Enter position to enter #{self.sign.upcase} in(row): "
    row = gets.chomp.downcase.to_i
    print "Enter position to enter #{self.sign.upcase} in(column): "
    column = gets.chomp.downcase.to_i
    #check if posiiton is already filled with 'x' or 'o'
    [row,column]
  end


end


class Game
  def initialize
    @new_board = Board.new(3,3)
    @new_board.show_board
    print "Player1 Choose a sign(X or O): "
    sign = gets.chomp.upcase
    @player1 = Player.new(sign)
    if sign == 'X' ? (sign = 'O') : (sign = 'X')
    end
    @player2 = Player.new(sign)
    @turn = true
    @win = false

    while !@win
      if @turn
        @new_board.modify_board(@player1.move, @player1)
        @new_board.show_board
        if @turn ? @turn = false : @turn = true
        end
      else
        @new_board.modify_board(@player2.move, @player2)
        @new_board.show_board
        if @turn ? @turn = false : @turn = true
        end
      end
      @win = @new_board.win?
      if @win
        puts "#{@win} Has won the game!"
      end
    end

  end

  def get_board
    @new_board.board
  end

  def win?
    # 9 possible win scenarios
    to_return = false
  end

end

Game.new()






#new_board = Board.new(3,3)
#puts new_board.board.inspect
#new_board.show_board
#player1 = Player.new
#player2 = Player.new
#new_board.modify_board(player1.add_move, player1.sign)
#new_board.show_board
#new_board.modify_board(player2.add_move, player2.sign)
#new_board.show_board
