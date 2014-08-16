# require_relative "card.rb"
class Hand
  attr_accessor :cards, :num_hash, :num_array, :suit_hash, :high_card
  
  def initialize(cards)
    @cards = cards
    @num_hash = Hash.new(0)
    @num_array = []
    @suit_hash = Hash.new(0)
    populate_hashes
  end
  
  def display_hand
    cards.each do |card|
      p card
    end
  end

  def get_high_card
    @num_array.pop
  end

  def populate_hashes
    cards.each do |card|
      @num_array << card.num
      @num_hash[card.num] += 1
      @suit_hash[card.suit] += 1  
      @num_array.sort!
    end
  end
  
  def value
    return 8 if is_straight_flush?
    return 7 if is_four_of_a_kind?
    return 6 if is_full_house?
    return 5 if is_flush?
    return 4 if is_straight?
    return 3 if is_three_of_a_kind?
    return 2 if is_two_pair?
    return 1 if is_one_pair?
    return 0 
  end
  
  # private
  
  def is_one_pair?
    @num_hash.has_value?(2)
  end
  
  def is_two_pair?
    @num_hash.size == 3 && @num_hash.has_value?(2)
  end
  
  def is_three_of_a_kind?
    @num_hash.has_value?(3) 
  end
  
  def is_straight?
    if @num_hash.size == 5 && (@num_array[0] == 1 && @num_array[1] == 10)
      return true
    end
    @num_array.each_with_index do |num, index|
      break if index + 1 == @num_array.length
      if (num + 1) != @num_array[index + 1]
        return false
      end
    end
    true
  end
  
  def is_flush?
    @suit_hash.has_value?(5)
  end
  
  def is_full_house?
    @num_hash.has_value?(3) && @num_hash.has_value?(2)
  end
  
  def is_four_of_a_kind?
    @num_hash.has_value?(4)
  end
  
  def is_straight_flush?
    is_flush? && is_straight?
  end
  
end

if __FILE__ == $PROGRAM_NAME
  ten = Card.new(9, :hearts)
  jack = Card.new(10, :hearts)
  queen = Card.new(11, :hearts)
  king = Card.new(12, :hearts)
  ace = Card.new(13, :hearts)
  cards = Hand.new([ten, jack, queen, king, ace])
  cards.display_hand
  p cards.num_hash
  p cards.suit_hash
  p cards.is_straight_flush?
end
