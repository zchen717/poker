require "rspec"
require "hand"

describe Hand do
  
  describe "#is_straight_flush?" do
    it "catches straight flush" do
      ten = Card.new(1, :hearts)
      jack = Card.new(10, :hearts)
      queen = Card.new(11, :hearts)
      king = Card.new(12, :hearts)
      ace = Card.new(13, :hearts)
      cards = Hand.new([ten, jack, queen, king, ace])
      expect(cards.is_straight_flush?).to be true
    end
  end
  
  describe "#is_four_of_a_kind?" do
    it "catches Richard Sherman" do
      ten = Card.new(10, :spades)
      jack = Card.new(10, :hearts)
      queen = Card.new(10, :clubs)
      king = Card.new(10, :diamonds)
      ace = Card.new(13, :hearts)
      cards = Hand.new([ten, jack, queen, king, ace])
      expect(cards.is_four_of_a_kind?).to be true
    end
  end
  describe "#is_full_house?" do
    it "catches Michael Crabtree" do
      ten = Card.new(9, :hearts)
      jack = Card.new(9, :clubs)
      queen = Card.new(9, :spades)
      king = Card.new(12, :hearts)
      ace = Card.new(12, :diamonds)
      cards = Hand.new([ten, jack, queen, king, ace])
      expect(cards.is_full_house?).to be true
    end
  end
  describe "#is_flush?" do
    it "catches straight flush" do
      ten = Card.new(2, :hearts)
      jack = Card.new(10, :hearts)
      queen = Card.new(11, :hearts)
      king = Card.new(12, :hearts)
      ace = Card.new(13, :hearts)
      cards = Hand.new([ten, jack, queen, king, ace])
      expect(cards.is_flush?).to be true
    end
  end
  describe "#is_straight?" do
    it "catches straight flush" do
      ten = Card.new(9, :hearts)
      jack = Card.new(10, :spades)
      queen = Card.new(11, :hearts)
      king = Card.new(12, :hearts)
      ace = Card.new(13, :hearts)
      cards = Hand.new([ten, jack, queen, king, ace])
      expect(cards.is_straight?).to be true
    end
  end
  describe "#is_three_of_a_kind?" do
    it "catches straight flush" do
      ten = Card.new(10, :clubs)
      jack = Card.new(10, :hearts)
      queen = Card.new(10, :spades)
      king = Card.new(12, :hearts)
      ace = Card.new(13, :hearts)
      cards = Hand.new([ten, jack, queen, king, ace])
      expect(cards.is_three_of_a_kind?).to be true
    end
  end
  describe "#is_two_pair?" do
    it "catches straight flush" do
      ten = Card.new(9, :hearts)
      jack = Card.new(9, :spades)
      queen = Card.new(11, :hearts)
      king = Card.new(11, :spades)
      ace = Card.new(13, :hearts)
      cards = Hand.new([ten, jack, queen, king, ace])
      expect(cards.is_two_pair?).to be true
    end
  end
  describe "#is_one_pair?" do
    it "catches straight flush" do
      ten = Card.new(10, :spades)
      jack = Card.new(10, :hearts)
      queen = Card.new(11, :spades)
      king = Card.new(12, :hearts)
      ace = Card.new(13, :clubs)
      cards = Hand.new([ten, jack, queen, king, ace])
      expect(cards.is_one_pair?).to be true
    end
  end
  
  describe
  
end