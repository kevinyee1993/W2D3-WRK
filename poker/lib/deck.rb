require_relative 'card'

class Deck

  attr_reader :card_deck

  SUITS = [
    'heart',
    'club',
    'spade',
    'diamond',
  ]

  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def initialize
    @card_deck = []
    self.shuffle_new_cards
  end

  def shuffle_new_cards
    cards = []

    SUITS.each do |suit|
      VALUES.each do |value|
        card = Card.new(value, suit)
        @card_deck << card
      end
    end
    nil
  end

  def draw(count = 1)
    dealt_cards = []
    
    count.times do
      dealt_cards << card_deck.pop
    end

    dealt_cards

  end



end
