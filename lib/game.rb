require_relative 'player.rb'
require_relative 'deck.rb'
require_relative 'card.rb'
require_relative 'hand.rb'

class Game
  
  CARDS = {
    "ace" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5, 
    "six" => 6, 
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
    "ten" => 10, 
    "jack" => 11, 
    "queen" => 12, 
    "king" => 13
  }
  
  SUITS = {
    "h" => :hearts,
    "s" => :spades,
    "d" => :diamonds,
    "c" => :clubs
  } 
  
  def initialize
    @deck = Deck.new 
    @players = []
    @hands = []
    @pot = 0
    @highest_bet = 0
    start_game
    play_game
  end
  
  def start_game
    puts "How many people are playing?"
    num_players = gets.chomp.to_i
    @deck.shuffle
    create_hands(num_players)
    create_players(num_players)
  end
  
  def create_hands(num_players)
    num_players.times {@hands << @deck.draw_hand}
  end
  
  def create_players(num_players)
    num_players.times {|n| @players << Player.new(@hands[n],1000,@deck)}
  end 
  
  def play_game
    until game_over?
      @pot = 0
      @highest_bet = 0
      @players_in_round = @players
      make_bets
      play_round
      make_bets
      calculate_winner
      check_eligible_players
      reset_in_hand
    end
  end
  
  def check_eligible_players
    @players.select! {|player| player.wallet > 0}
  end
  
  def make_bets
    @players.select!{ | player| player.in_round }.each_with_index do |player, index|
      puts "Player #{index}, you have $#{player.wallet}left."
      puts "Your cards are #{player.hand.display_hand}"
      puts "You may raise, see, or fold."
      action = gets.chomp.downcase
      if action == "raise"
        puts "How much would you like to raise?"
        raise_amt = gets.chomp
        check_raise(raise_amt)
      elsif action == "see"
        player.see(@highest_bet)
        @pot += @highest_bet
      elsif action == "fold"
        player.fold
        player.in_round = false
      else
        raise "Not a legal move"
      end
    end
  end
  
  def play_round
    @players.each do |player|
      puts "Player #{index}, how many cards would you like to discard?"
      num_discard = gets.chomp
      num_discard.times do 
        puts "Which card would you like to discard? (e.g. ten hearts)"
        card = gets.chomp.downcase.split(" ")
        num = CARDS[card[0][0]]
        suit = SUITS[card[1][0]]
        player.discard(num, suit)
      end
    end
  end
  
  def calculate_winner
    winner_index = []
    highest_value = 0
    @players.each_with_index do |player, index|
      next unless player.in_hand
      if player.hand.value > highest_value
        highest_value = player.hand.value 
        winner_index[0] = index
      elsif player.hand.value == highest_value && highest_value != 0
        winner_index << index
      end
      if winner_index.length > 1
        break_tie
      else
        @players[index].wallet += @pot
      end
    end
  end
  
  def break_tie
    puts "break tie"
  end
  
  def reset_in_hand
    @players.each do |player|
      player.in_hand = true
    end
  end
    
  def check_raise(amount)
    until amount > @highest_bet
      puts "You must raise at least #{@highest_bet}."
      puts "How much would you like to raise?"
      amount = gets.chomp
    end
    @pot += amount 
    player.raise(amount)
  end

  def game_over?
    @players.length == 1
  end
  
end

if __FILE__ == $PROGRAM_NAME
  g = Game.new
end
      