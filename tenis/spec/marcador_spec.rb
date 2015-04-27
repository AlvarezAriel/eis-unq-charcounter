require 'rspec'
require_relative '../model/marcador.rb'

describe 'Marcador' do

  it 'debe comenzar con sets en (0,0)' do
    (player_one_set, player_two_set) = Marcador.new.set
    player_one_set.should be 0
    player_two_set.should be 0
  end

end