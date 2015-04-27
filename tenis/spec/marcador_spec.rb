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

    it 'si el punto del jugador estaba en 15 debe pasar a 30' do
      @marcador.gana_punto :manco
      @marcador.gana_punto :manco
      @marcador.jugador(:manco).puntos.value.should be :thirty
    end

    it 'si el punto del jugador estaba en 30 debe pasar a 40' do
      3.times {@marcador.gana_punto :manco}
      @marcador.jugador(:manco).puntos.value.should be :forty
    end

    it 'si el punto del jugador estaba en 40 y el rival en menos de 40, debe ganar el game' do
      4.times {@marcador.gana_punto :roger}
      @marcador.jugador(:roger).game.should be 1
    end

    it 'si ambos jugadores tenian 40, el que anotó pasa a tener ventaja' do
      3.times {@marcador.gana_punto :manco}
      4.times {@marcador.gana_punto :roger}
      @marcador.jugador(:roger).has_advantage?.should be true
    end

  end

  describe 'cuando un jugador gana un game' do

    it 'el puntaje deve volver a (0,0)' do
      2.times {@marcador.gana_punto :manco}
      4.times {@marcador.gana_punto :roger}
      @marcador.jugador(:roger).puntos.value.should be :zero
      @marcador.jugador(:manco).puntos.value.should be :zero

    end

    it 'y es su sexto game en el set, gana el set' do
      6.times {
        2.times {@marcador.gana_punto :manco}
        4.times {@marcador.gana_punto :roger}
      }

      @marcador.jugador(:roger).set.should be 1
      @marcador.jugador(:manco).set.should be 0
    end

  end

  describe 'cuando un jugador gana un set' do

    it 'el puntaje deve volver a (0,0)' do
      6.times {
        2.times {@marcador.gana_punto :manco}
        4.times {@marcador.gana_punto :roger}
      }

      @marcador.jugador(:roger).puntos.value.should be :zero
      @marcador.jugador(:manco).puntos.value.should be :zero

    end

    it 'el game deve volver a (0,0)' do
      6.times {
        2.times {@marcador.gana_punto :manco}
        4.times {@marcador.gana_punto :roger}
      }

      @marcador.jugador(:roger).game.should be 0
      @marcador.jugador(:manco).game.should be 0

    end

    it 'y es su segundo set, entonces gana el match' do
      (2*6).times {
        2.times {@marcador.gana_punto :manco}
        4.times {@marcador.gana_punto :roger}
      }
      @marcador.jugador(:roger).won_match?.should be true
    end
  end

end