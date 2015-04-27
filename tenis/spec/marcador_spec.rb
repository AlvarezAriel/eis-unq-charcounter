require 'rspec'
require_relative '../model/marcador.rb'

describe 'Marcador' do

  before(:each) do
    @marcador = Marcador.new(:roger, :manco)
  end


  describe 'al comenzar el partido' do

    it 'debe tener sus sets en (0,0)' do
      @marcador.jugador(:roger).set.should be 0
      @marcador.jugador(:manco).set.should be 0
    end

    it 'debe tener sus games en (0,0)' do
      @marcador.jugador(:roger).game.should be 0
      @marcador.jugador(:manco).game.should be 0
    end

    it 'debe tener sus puntos en (0,0)' do
      @marcador.jugador(:roger).puntos.value.should be :zero
      @marcador.jugador(:manco).puntos.value.should be :zero
    end

  end

  describe 'al anotarse un punto' do
    it 'si el punto del jugador estaba en 0 debe pasar a 15' do
      @marcador.gana_punto :manco
      @marcador.jugador(:manco).puntos.value.should be :fifteen
    end

  end

end