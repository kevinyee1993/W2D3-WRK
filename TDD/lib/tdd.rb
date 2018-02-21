class Array

  def remove_dups
    unduped = []

    self.each_with_index do |el, idx|
      count = self.count(el)
      if count >= 2
        unduped << el
        self.delete_at(idx)
      end

    end

    unduped

  end

  def two_sum
    zero_sum_idx = []

    (0...self.length - 1).each do |idx|
      (1...self.length).each do |idx2|
        if self[idx] + self[idx2] == 0
          zero_sum_idx << [idx, idx2]
        end
      end
    end

    zero_sum_idx
  end

  def my_transpose
    transposed = []

    self.each_index do |idx|
      new_row = []
      self.each_index do |idx2|
        new_row << self[idx2][idx]
      end

      transposed << new_row
    end

    transposed
  end

  def stock_picker
    # best_buy = self[0]
    # best_sell = self[1]
    best_buy_day = 0
    best_sell_day = 1
    biggest_difference = self[best_sell_day] - self[best_buy_day]

    (0...self.length - 1).each do |idx|
      (1...self.length).each do |idx2|
        buy = self[idx]
        sell = self[idx2]

        if (sell - buy) > biggest_difference
          best_buy_day = idx
          best_sell_day = idx2
          biggest_difference = sell - buy
        end

      end
    end

    [best_buy_day, best_sell_day]
  end

end
