require_relative 'game_point'

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
