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

class Player
  attr_accessor :set, :game, :puntos, :rival
  attr_reader :won_match

  def initialize
    (@set, @game, @puntos) = [0,0, GamePoint.new]
    @won_match = false
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

end
