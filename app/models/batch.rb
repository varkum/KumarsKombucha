class Batch < ApplicationRecord
  has_many :orders
  
  def self.current
    last
  end
end
