class OrderProduct < ApplicationRecord
  belongs_to :orderes
  belongs_to :product
end
