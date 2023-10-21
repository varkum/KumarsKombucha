class Order < ApplicationRecord
  belongs_to :batch

  enum :status, [:placed, :completed, :reminded, :incomplete], default: :placed
end
