require_relative 'player'

class Game
  attr_reader :turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @turn = player_1
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    if player == player_1
      player_2.takes_damage
    else
    player_1.takes_damage
    end
  end

  def switch_turn
    if @turn == player_1
      @turn = player_2
    else
      @turn = player_1
    end
  end

end
