require "rspec"
require "card.rb"
require "deck.rb"
require "hand.rb"
require "player.rb"

describe Deck do
  subject(:deck) {Deck.new}
  
  it "shuffled deck is not equal to original" do
    original_deck = deck.deck
    expect(deck.shuffle).to_not eq(original_deck)
  end
end

describe Hand do
  
  describe "#is_straight_flush?" do
    it "catches straight flush" do
      ten = Card.new(9, :hearts)
      jack = Card.new(10, :hearts)
      queen = Card.new(11, :hearts)
      king = Card.new(12, :hearts)
      ace = Card.new(13, :hearts)
      cards = Hand.new([ten, jack, queen, king, ace])
      expect(cards.is_straight_flush?).to be true
    end
  end
  
end