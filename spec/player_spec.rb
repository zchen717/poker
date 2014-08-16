require "rspec"
require "deck"
require "hand"
require "player"

describe Player do
  subject(:deck) {Deck.new}
  subject(:player) {Player.new(deck.draw_hand,100,deck)}
  describe "#discard" do
    it "discards card" do
      discard_num = player.hand[0].num
      discard_suit = player.hand[0].suit
      player.discard(discard_num, discard_suit)
      expect(player.hand.length).to eq(4)
    end
  end
end