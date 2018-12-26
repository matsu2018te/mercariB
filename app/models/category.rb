class Category < ApplicationRecord
  has_ancestry
  has_many :products

  def g_parent
    self.parent.parent
  end
end
