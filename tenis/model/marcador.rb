class Marcador

  def initialize(name_player_1, name_player_2)
    @players = {
        name_player_1 => Player.new,
        name_player_2 => Player.new
    }
  end

  def gana_punto(jugador)
    @players[jugador].puntos.next
  end

  def jugador(nombre)
    @players[nombre]
  end
end

class Player
  attr_accessor :set, :game, :puntos

  def initialize
    (@set, @game, @puntos) = [0,0, GamePoint.new]
  end
end

class GamePoint
  def initialize
    @current = :zero
    @progression = {
        :zero =>    :fifteen,
        :fifteen => :thirty,
        :thirty =>  :forty,
        :forty =>   :advantage
    }
  end

  def next
    @current = @progression[@current]
  end

  def reset
    @current = :zero
  end

  def value
    @current
  end
end