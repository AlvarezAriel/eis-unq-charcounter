require 'rspec'
require_relative '../model/marcador.rb'

describe 'Marcador' do

  describe 'al comenzar el partido' do
    it 'debe tener sus sets en (0,0)' do
      (player_one_set, player_two_set) = Marcador.new.set
      player_one_set.should be 0
      player_two_set.should be 0
    end

    it 'debe tener sus games en (0,0)' do
      (player_one_game, player_two_game) = Marcador.new.game
      player_one_game.should be 0
      player_two_game.should be 0
    end

    it 'debe tener sus puntos en (0,0)' do
      (player_one_puntos, player_two_puntos) = Marcador.new.puntos
      player_one_puntos.should be 0
      player_two_puntos.should be 0
    end

  end

end