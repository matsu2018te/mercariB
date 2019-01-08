require 'rails_helper'
describe Brand do
  describe '#create' do
    it "is valid with a name" do
      brand = build(:brand)
      expect(brand).to be_valid
    end

    it "is invalid without a name" do
      product = build(:product,name: "",)
      product.valid?
      expect(product.errors[:name]).to include("が入力されていません。")
    end
  end
end
