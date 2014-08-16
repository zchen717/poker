# require_relative 'player.rb'
# require_relative 'card.rb'
class Deck

  attr_reader :deck
  
  def initialize
    @deck = []
    nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    suits_hash = {0 => :spades, 1 => :hearts, 2 => :diamonds, 3 => :clubs}
    suits = [0,1,2,3]
    
    nums.product(suits).each do |coords|
      @deck << Card.new(coords[0], suits_hash[coords[1]])
    end
  end
  
  def display_deck
    @deck.each do |card|
      p card
    end
  end
  
  def shuffle
    new_deck = []
    until @deck.empty?
      index = rand(@deck.length)
      new_deck << @deck[index]
      @deck.delete_at(index)
    end
    @deck = new_deck
  end
  
  def draw_hand
    hand = []
    5.times do
      hand << @deck.pop
    end
    hand
  end
  
  def draw_card
    @deck.pop
  end

end

if __FILE__ == $PROGRAM_NAME
  d = Deck.new
  d.shuffle
  d.display_deck
end