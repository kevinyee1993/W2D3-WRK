class TowersOfHanoi
  attr_accessor :board

  def initialize(board = [[1, 2, 3], [], []])
    @board = board
  end

  def move(input)
    starting_tower = input[0]
    to_tower = input[1]
    raise "empty tower" if @board[starting_tower].empty?


    disc = @board[starting_tower].shift

    if valid_position?(disc, to_tower)
      @board[to_tower].unshift(disc)
    else
      @board[starting_tower].unshift(disc)
    end


  end

  def valid_position?(disc, to_tower)
    return true if @board[to_tower].empty?
    return true if disc < @board[to_tower].first

    false
  end

  def get_move
    puts "What tower do you want to select from?"
    from_tower = gets.chomp

    puts "Where would you like to move it?"
    to_tower = gets.chomp

    [from_tower, to_tower]
  end

  def play
    until won?
      play_move = get_move
      move(play_move)
    end
  end

  def won?
    tower1_len = board[1].length == 3
    tower2_len = board[2].length == 3
    return true if board[0].empty? && (tower2_len || tower1_len)
    false
  end
end
