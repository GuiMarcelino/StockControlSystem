class Client < ApplicationRecord
  validates :name, :email, :phone, presence: true
end
