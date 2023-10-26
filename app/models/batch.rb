class Batch < ApplicationRecord
  has_many :orders

  def self.current
    last
  end

  def self.previous
    second_to_last
  end

  def bottles_left
    bottles - orders.pluck(:quantity).sum
  end

  def no_bottles_left?
    bottles - orders.pluck(:quantity).sum <= 0
  end
end
