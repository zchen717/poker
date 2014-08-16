class Player
  
  attr_accessor :hand, :wallet, :deck, :in_round
  
  def initialize(hand, wallet, deck)
    @hand = hand
    @wallet = wallet
    @deck = deck
    @in_round = true
  end
  
  def discard(num,suit)
    @hand.reject! {|card| card.num ==  num && card.suit == suit}
  end
  
  def fold
    @hand = []
  end
  
  def see(amount)
    @wallet -= amount
  end
  
  def raise(amount)
    @wallet -= amount
  end

end