require 'spec_helper'

require_relative '../board'
require_relative '../presentation'

describe "An empty board" do
  let(:board) { Board.new }
  subject(:board_presentation) { Presentation.new board }

  specify do
    expect(board_presentation.call).to eq <<-END
+---+---+---+
|   |   |   |
+---+---+---+
|   |   |   |
+---+---+---+
|   |   |   |
+---+---+---+
    END
  end

  context "when a move is made in the middle" do
    before do
      board.make_move('X', 1, 1)
    end

    specify do
    expect(board_presentation.call).to eq <<-END
+---+---+---+
|   |   |   |
+---+---+---+
|   | X |   |
+---+---+---+
|   |   |   |
+---+---+---+
    END
  end
  end

  context "when a move is made in the middle" do
    before do
      board.make_move('X', 1, 1)
    end

    specify do
    expect(board_presentation.call).to eq <<-END
+---+---+---+
|   |   |   |
+---+---+---+
|   | X |   |
+---+---+---+
|   |   |   |
+---+---+---+
    END
  end
  end
end
