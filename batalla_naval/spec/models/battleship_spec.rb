require_relative '../../app/models/Board.rb'
require_relative '../spec_helper.rb'

describe 'Battleship' do

  before (:each) do
    @board = Board.new 5,5
  end

  it 'create a Board' do
    expect(@board.kind_of? Board).to eq true
  end

  it 'should create a 5x5 Board' do
    expect(@board.size[0]).to eq 5
    expect(@board.size[1]).to eq 5
  end

  describe 'when using a 5x5 board' do

    it 'should have water on 1:1' do
      expect(@board.is_water_at?(1,1)).to be true
    end

    it 'should not have water on 1:1 if a ship is in 1:1' do
      @board.add_ship_at(1,1)
      expect(@board.is_water_at?(1,1)).to be false
    end

  end
end