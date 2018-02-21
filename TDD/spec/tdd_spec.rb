require 'tdd'
require 'rspec'

RSpec.describe Array do

  describe "#remove_dups" do
    let(:duped){[1,2,2,3,3,4]}
    let(:unduped){[1,2,3,4]}
    let(:removed){[2,3]}

    it "removes duplicate elements from an array" do
      duped.remove_dups
      expect(duped).to eq(unduped)
    end

    it "returns the unique elements in order of which they first appear" do
      expect(duped.remove_dups).to eq(removed)
    end
  end

  describe '#two_sum' do
    let(:sum) { [1,2, -1, - 2] }

    it 'returns the indices when the numbers sum to zero' do
      expect(sum.two_sum).to include([0, 2])
      #checks includes correct indices, order doesnt matter
    end

    it "returns indices sorted in order" do
      expect(sum.two_sum).to eq([[0,2], [1, 3]])
    end

    # When no two numbers sum to zero...
  end

  describe '#my_transpose' do
    let(:matrix) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
      ] }

    it "transposes a matrix correctly" do
      expect(matrix.my_transpose).to eq([[0, 3, 6],[1, 4, 7], [2, 5, 8]])
    end

    # Does/does not mutate the original matrix
  end


  describe '#stock_picker' do
    let(:stock) { [1,5,3,7,6] }
    let(:stock2) { [100, 0, 20, 50, 60]}
    # When there are no profitable days
    it "returns most profitable days to buy and sell stock" do
      expect(stock.stock_picker).to eq([0,3])
    end

    it "correctly returns sequential days" do
      days = stock.stock_picker
      expect(days[0]).to be < days[1]
    end

  end

end
