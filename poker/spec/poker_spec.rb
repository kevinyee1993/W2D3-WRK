require 'rspec'
require 'card'
require 'deck'

RSpec.describe Card do

  describe '#initialize' do
    subject(:new_card){ Card.new("K", "Club") }

    it "creates a card with a face value" do
      expect(new_card.value).to eq("K")
    end

    it "creates a card with a suit value" do
      expect(new_card.suit).to eq("Club")
    end

  end

end

RSpec.describe Deck do

  describe '#initialize' do
    subject(:new_deck){ Deck.new }

    it "holds 52 cards" do
      expect(new_deck.card_deck.length).to eq(52)
    end

    it "holds 52 unique cards" do
      # subject(:new_deck){ Deck.new }
      # let (:cards) { new_deck.card_deck.map { |object| [object.value, object.suit] } }
      cards = new_deck.card_deck.map { |object| [object.value, object.suit] }
      uniq_deck = cards.uniq
      expect(cards).to eq(uniq_deck)
    end

    let(:hearts) { new_deck.card_deck.select{|card| card.suit == 'heart' } }
    it "holds 14 hearts" do
      # subject(:new_deck){ Deck.new }

      expect(hearts.length).to eq(13)
    end
  end

  describe '#draw'
    let(:card1) { double("card1") }
    let(:card2) { double("card2") }
    let(:card3) { double("card3") }

    let(:cards)  { [card1, card2, card3] }

    it 'draws one correct card from the deck' do
      allow(:new_deck).to receive(:card_deck).and_return(:cards)
      expect(cards.draw).to eq([card3])
      expect(cards.card_deck).to eq([card1, card2])
    end

    it 'draws multiple correct cards from the deck' do
      allow(:new_deck).to receive(:card_deck).and_return(:cards)
      expect(cards.draw(2)).to eq([card3, card2])
      expect(cards.card_deck).to eq([card1])
    end

    it 'should shrink the size of the deck correctly' do
      cards.draw
      expect(cards.card_deck.length).to eq(2)
    end

end
