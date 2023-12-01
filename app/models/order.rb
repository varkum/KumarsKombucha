class Order < ApplicationRecord
  belongs_to :batch
  
  enum :status, [ :placed, :completed, :reminded, :incomplete ], default: :placed
  enum :pickup_day, [ :tuesday, :wednesday, :thursday, :friday ]
  
  scope :unfulfilled, -> { where(status: "placed") }
end
