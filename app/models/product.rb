class Product < ApplicationRecord
  validates :name, :amount, :value_buy, :value_sale,  presence: true

end
