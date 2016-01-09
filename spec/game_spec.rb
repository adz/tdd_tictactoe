require 'spec_helper'

require_relative '../board'

# given a new game
# making a move
# will store my marker at that position
describe "Storing positions in a new TicTacToe game" do
  context "When making a move" do
    before do
      @board = Board.new
      @board.make_move('X', 1, 1)
    end

    it "will store my marker at that position" do
      expect(@board.at(1, 1)).to eq 'X'
    end

    it "will not store my marker at another position" do
      expect(@board.at(0, 0)).to eq ' '
    end

    it 'will not allow storing a makre over an existing' do
      expect(@board.make_move('O', 1, 1)).to eq false
    end

    it "will not be complete" do
      expect(@board.complete?).to eq false
    end

    context "Then making a row complete with differente markers in two more moves" do
      before do
        @board.make_move('X', 0, 1)
        @board.make_move('O', 2, 1)
      end

      it "will not be complete" do
        expect(@board.complete?).to eq false
      end
    end

    context "Then making a row complete with two more moves" do
      before do
        @board.make_move('X', 0, 1)
        @board.make_move('X', 2, 1)
      end

      it "will be complete" do
        expect(@board.complete?).to eq true
      end

      it "will be winner 'X'" do
        expect(@board.winner).to eq 'X'
      end
    end

    context "Then making a col complete with two more moves" do
      before do
        @board.make_move('X', 1, 0)
        @board.make_move('X', 1, 2)
      end

      it "will be complete" do
        expect(@board.complete?).to eq true
      end
    end

    context "Then making a diagonal complete with two more moves" do
      before do
        @board.make_move('X', 0, 0)
        @board.make_move('X', 2, 2)
      end

      it "will be complete" do
        expect(@board.complete?).to eq true
      end
    end
  end

  context "When making a move with an invalid marker" do
    before do
      @board = Board.new
    end

    it "will raise an exception" do
      expect{@board.make_move("x", 1, 1)}.to raise_error(ArgumentError)
    end
  end
end
