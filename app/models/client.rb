class Client < ApplicationRecord
  validates :name, :email, :phone, presence: true
  validates :email, uniqueness:  true
end
