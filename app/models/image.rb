class Image < ApplicationRecord
  belongs_to :product, optional: true
  mount_uploader :image , ImageUploader
  mount_uploader :image2 , ImageUploader
  mount_uploader :image3 , ImageUploader
  mount_uploader :image4 , ImageUploader
end

