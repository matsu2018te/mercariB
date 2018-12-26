class SellStatus < ApplicationRecord
  has_many :products

  enum sell_status: {sale: 0,trading: 1,sold: 2}
end
