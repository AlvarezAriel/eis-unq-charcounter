class Marcador

  def initialize(name_player_1, name_player_2)
    (player1, player2) = Player.new, Player.new
    player1.rival = player2
    player2.rival = player1
    @players = {
        name_player_1 => player1,
        name_player_2 => player2
    }
  end

  def gana_punto(jugador)
    @players[jugador].inc_point
  end

  def jugador(nombre)
    @players[nombre]
  end
end

class Player
  attr_accessor :set, :game, :puntos, :rival

  def initialize
    (@set, @game, @puntos) = [0,0, GamePoint.new]
  end

  def has_advantage?
    @puntos.advantage
  end

  def inc_point
    if puntos.value == :forty && rival.puntos.value != :forty
      won_game
    else
      puntos.next
    end
  end

  def won_game
    @game = @game + 1
    puntos.reset
    rival.puntos.reset
  end

end

class GamePoint
  attr_accessor :advantage
  def initialize
    @advantage = false
    @current = :zero
    @progression = {
        :zero =>    :fifteen,
        :fifteen => :thirty,
        :thirty =>  :forty
    }
  end

  def next
    @current = @progression[@current]
  end

  def reset
    @current = :zero
    @advantage = false
  end

  def value
    @current
  end
end