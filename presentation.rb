class Presentation
  def initialize(board)
    @board = board
  end

  def call
    sprintf <<-END, @board.at(1, 1)
+---+---+---+
|   |   |   |
+---+---+---+
|   | %s |   |
+---+---+---+
|   |   |   |
+---+---+---+
    END
  end

end
