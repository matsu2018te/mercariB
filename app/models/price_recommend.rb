class PriceRecommend < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :category_id, :brand_id, :status
end
