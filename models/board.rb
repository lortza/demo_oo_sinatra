# Classes do NOT have access to the sessions hash

class Board

  attr_accessor :board_arr

  def initialize(existing_board)
    if existing_board == nil
      @board_arr = ['alex']
    else
      @board_arr = JSON.parse( existing_board )
    end
  end

  def place_piece(piece)
    @board_arr << piece
  end

end