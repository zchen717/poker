

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

