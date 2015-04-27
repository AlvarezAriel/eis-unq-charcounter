# Usar la progresión de 0-15-30-40 en realidad no aporta nada contra usar números y calcular la ventaja
# con diferencia de dos. Pero de esta forma al menos era un poco más interesante.


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

  def next; @current = @progression[@current] end

  def reset
    @current = :zero
    @advantage = false
  end

  def value;  @current end

  def add_advantage;    @advantage = true end
  def remove_advantage; @advantage = false end
end

class Player
  attr_accessor :set, :game, :puntos, :rival

  def initialize
    (@set, @game, @puntos) = [0,0, GamePoint.new]
    @won_match = false
  end

  def has_advantage?
    @puntos.advantage
  end

  def inc_point
    if has_40_points? && (!rival.has_40_points? || has_advantage?)
      won_game
    elsif has_40_points? && rival.has_40_points? && rival.has_advantage?
      rival.puntos.remove_advantage
    elsif has_40_points? && rival.has_40_points?
      puntos.add_advantage
    else
      puntos.next
    end
  end

  def won_game
    @game = @game + 1
    puntos.reset
    rival.puntos.reset
    if @game == 6
      won_set
    end
  end

  def won_set
    @game = 0
    @set = @set+1
    if @set == 2
      @won_match = true
    end
  end

  def won_match?
    @won_match
  end

  def has_40_points?
    puntos.value == :forty
  end

end
