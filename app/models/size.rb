class Size < ApplicationRecord
  has_many :products
  belongs_to :size_group
end
