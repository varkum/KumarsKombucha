class Batch < ApplicationRecord
  has_many :orders

  def self.current
    last
  end

  def self.previous
    second_to_last
  end
end
