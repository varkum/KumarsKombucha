class Order < ApplicationRecord
  belongs_to :batch
  
  enum :status, [ :placed, :completed, :reminded, :incomplete ], default: :placed
  enum :pickup_day, [ :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday ]
  
  scope :unfulfilled, -> { where(status: "placed") }
end
