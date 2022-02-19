class Merchandiser < ApplicationRecord
  validates :email, uniqueness:  true
end
