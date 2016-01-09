class Board
  ALLOWED_MARKERS = %w(X O)

  Line = Struct.new(:values) do
    def complete?
      ALLOWED_MARKERS.each do |marker|
        complete = values.all? { |value| value == marker }
        return true if complete
      end
      false
    end
  end

  def initialize
    @board = Hash.new ' '
    @rows = (0..2)
    @cols = (0..2)
  end

  def make_move(marker, x, y)
    raise ArgumentError, "Not allowed marker" unless ALLOWED_MARKERS.include?(marker)
    return false if at(x, y) != ' '
    @board[[x,y]] = marker
  end

  def at(x, y)
    @board[[x,y]]
  end

  def winner
    return nil unless complete?
    complete_line.values.first
  end

  def complete?
    !complete_line.nil?
  end

  def complete_line
    (row_lines + col_lines + diagonal_lines).detect(&:complete?)
  end

  def row_lines
    @rows.map { |row_index| line_at_row(row_index) }
  end

  def col_lines
    @cols.map { |col_index| line_at_col(col_index) }
  end

  def line_at_row(row_index)
    Line.new @cols.map { |col_index| at(col_index, row_index) }
  end

  def line_at_col(col_index)
    Line.new @rows.map { |row_index| at(col_index, row_index) }
  end

  def diagonal_lines
    [diagonal_line]
  end

  def diagonal_line
    Line.new(@rows.map{ |row_index| at(row_index, row_index) })
  end
end
