require './lib/connect-four.rb'

describe Game do

    describe "#create_board" do
      let(:board) { subject.create_board }
      it "creates a board object with an array" do
        expect(subject.board).to be_an_instance_of(Array)
      end

      it "returns an array of length 6" do
        expect(subject.board.length).to eql(6)
      end

      it "returns a subarray of length 7 for each element of array" do
        expect(subject.board[0].length).to eql(7)
      end
    end

    describe "#edit_board" do
      it "adds desired string to the desired element" do
        subject.edit_board("X", [0, 0])
        expect(subject.board[0][0]).to match("X")
      end
    end

    describe "#show_board" do
      it "prints board to console" do
        expect{subject.show_board}.to output("[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n").to_stdout
      end
    end

    describe "#turn_decider" do
      it "decides whose turn it is" do
        expect(subject.turn_decider()).to eql(subject.players.players[0])
      end
    end

    describe "#select_column" do

      it "allows player to choose the column to play in and saves" do
        subject.stub(:gets).and_return(0)
        expect(subject.select_column).to eql(0)
      end

      it "prompts player to choose again on invalid input" do
        subject.stub(:gets).and_return(9, 0)
        expect{subject.select_column}.to output("Pick a column between 0 - 6\n" +
            "Please enter a valid column\n").to_stdout
      end
    end


    describe "#find_valid_square_in_column" do
      let(:board) { subject.create_board }
      it "finds the first free square in the chosen column" do
        expect(subject.find_valid_square_in_column(0)).to eql([5, 0])
      end


      it "prompts player to choose another column if column full" do
        for i in (0..5)
          subject.edit_board("X", [i, 0])
        end
        expect{subject.find_valid_square_in_column(0)}.to output("Column full, please choose a different column\nPick a column between 0 - 6\n").to_stdout
      end

    end

    describe "#play_turn" do
      it "edits board and player moves array with the correct square" do
        subject.stub(:gets).and_return(0)
        expect{subject.play_turn}.to output("[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\nPick a column between 0 - 6\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[nil, nil, nil, nil, nil, nil, nil]\n[\"X\", nil, nil, nil, nil, nil, nil]\n").to_stdout
      end
    end

    describe "#horizontal_winner?" do
      # it "returns true if player has 4 consecutive squares in the same row" do
      #   expect(subject.horizontal_winner([[5, 0], [5, 1], [5, 2], [5, 3], [4, 1]])).to eql(true)
      # end

      it "returns false if player does not have 4 cons squares" do
        expect(subject.horizontal_winner([[5, 0], [5, 1], [5, 2], [5, 6], [4, 1], [5, 5], [5, 3]])).to eql(false)
      end
    end

    describe "#vertical_winner?" do
      it "returns true if player has 4 consecutive squares in the same column" do
        expect(subject.vertical_winner([[5, 0], [4, 0], [3, 0], [2, 0], [4, 1]])).to eql(true)
      end

      it "returns false if player does not have 4 cons squares in same column" do
        expect(subject.vertical_winner([[3, 0], [5, 1], [5, 2], [5, 3], [4, 1]])).to eql(false)
      end
    end

    describe "#diagonal_winner?" do
      it "returns true if player has 4 consecutive diagonal squares" do
        expect(subject.diagonal_winner([[5, 0], [4, 1], [3, 2], [4, 3]])).to eql(true)
      end
    end


end

describe Player do

  describe "#initialize" do

    it "creates array of two players" do
      expect(subject.players.length).to eql(2)
    end

    it "creates a hash for each player with name and symbol" do
      expect(subject.players[0][:name]).to eql("Player 1")
      expect(subject.players[1][:symbol]).to eql("O")
    end
  end

  describe "#get_name" do

    it "sets name of chosen player to desired input" do
      subject.players[0][:name] = "Zyad"
      expect(subject.players[0][:name]).to eql("Zyad")
    end
  end
end
