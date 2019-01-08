require 'rails_helper'
describe Image do
  describe '#create' do
    it "is invalid without a image" do
      product = build(:product,image: "",)
      product.valid?
      expect(product.errors[:image]).to include("が入力されていません。")
    end

    it "is invalid without a product_id" do
      product = build(:product,product_id: "",)
      product.valid?
      expect(product.errors[:product_id]).to include("が入力されていません。")
    end
  end
end
