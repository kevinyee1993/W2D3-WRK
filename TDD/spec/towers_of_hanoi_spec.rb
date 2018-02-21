require 'rspec'
require 'towers_of_hanoi'

RSpec.describe TowersOfHanoi do

  describe '#initialize' do
    subject(:game) { TowersOfHanoi.new }

    it 'creates a proper starting board' do
      expect(game.board).to eq([[1, 2, 3], [], []])
    end
  end



  describe '#move' do
    let (:towers) {TowersOfHanoi.new([[1, 2, 3], [], []]) }
    let (:towers2) {TowersOfHanoi.new([[1], [2], [3]])}

    it "raises an error if a selected tower is empty" do
      expect{ towers.move([1,0]) }.to raise_error("empty tower")
    end

    it 'tower does not changeif larger disc cannot be placed on a smaller disc' do
      towers2.move([1, 0])
      expect(towers2.board).to eq([[1], [2], [3]])
    end

    it "executes a legal move" do
      towers.move([0, 1])
      expect(towers.board).to eq([[2, 3], [1], []])
    end
  end

  describe 'won?' do
    let (:towers) {TowersOfHanoi.new([[1, 2, 3], [], []]) }
    let (:towers3) {TowersOfHanoi.new([[1], [2, 3], []]) }

    it "continues until won?" do
      expect(towers).not_to be_won
    end

    it "returns true when the game is won" do
      allow(towers).to_receive(:board).and_return([[], [1, 2, 3], []])
      expect(towers).to be_won      
    end

    it "ends the game when a winning move is executed" do
      towers3.move([0, 1])
      expect(towers3).to be_won
    end

    #make_move
      #get_move -> return value will be user input
    #make_move(arg)



  end
end
