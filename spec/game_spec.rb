require 'game'

describe Game do

  subject(:game) { described_class.new(player_1, player_2) }
  subject(:game2) { described_class.new(player_1, dead_player) }
  let(:player_1) { double :player, hp: 60 }
  let(:player_2) { double :player, hp: 60 }
  let(:dead_player) { double :player, hp: 0 }

    describe '#player_1 and #player_2' do
      it 'gets a player_1' do
        expect(game.player_1).to eq player_1
      end
      it 'gets a player_2' do
        expect(game.player_2).to eq player_2
      end
    end

  describe 'allows us to play a game' do
    describe '#attack' do
      it 'allows player1 to attack player2' do
        expect(player_2).to receive(:takes_damage)
        game.attack(player_1)
      end
    end
  end

  describe '#switch_turn' do
    it 'switches the turn variable between players' do
      expect(player_2).to receive(:takes_damage)
      game.attack(player_1)
      game.switch_turn
      expect(game.turn).to eq player_2
    end
  end

  describe '#player_loses?' do
    it 'returns true if player hp is 0' do
      expect(game2.player_loses?(dead_player)).to eq true
    end
  end


end
