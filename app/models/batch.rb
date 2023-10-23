class Batch < ApplicationRecord
  has_many :orders

  def self.current
    last
  end

  def self.previous
    second_to_last
  end

  def bottles_left
    bottles - orders.pluck.sum('quantity') == 0
  end
end
