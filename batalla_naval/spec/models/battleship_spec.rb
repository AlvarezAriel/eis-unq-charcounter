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
      @board.add_ship(Ship.small_at(1,1))
      expect(@board.is_water_at?(1,1)).to be false
    end

  end

  it 'should get hit if bombed on it' do
    @ship = Ship.large_at(1,1)
    @board.add_ship(@ship)
    @board.shoot_at(1,2)

    expect(@ship.is_hit?).to be true
  end


  it 'a large one should sink if bombed on all its sections' do
    @ship = Ship.large_at(1,1)
    @board.add_ship(@ship)
    @board.shoot_at(1,1)
    @board.shoot_at(1,2)

    expect(@ship.is_sink?).to be true
  end


  it 'a small one should sink if bombed on all its sections' do
    @ship = Ship.small_at(1,1)
    @board.add_ship(@ship)
    @board.shoot_at(1,1)

    expect(@ship.is_sink?).to be true
  end
end