require 'rails_helper'
describe Product do

  describe '#create' do
    it "is valid with a seller_id,name,info,price,status,delivery_fee_owner,delivery_date,shipping_method,category_id,brand_id,sell_status_id,size_id" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = build(:product,name: "",)
      product.valid?
      expect(product.errors[:name]).to include("が入力されていません。")
    end

    it "is invalid without a info" do
      product = build(:product,info: "",)
      product.valid?
      expect(product.errors[:info]).to include("が入力されていません。")
    end

    it "is invalid without a category_id" do
      product = build(:product,category_id: "",)
      product.valid?
      expect(product.errors[:category_id]).to include("が入力されていません。")
    end


    it "is invalid without a size_id" do
      product = build(:product,size: "",)
      product.valid?
      expect(product.errors[:size]).to include("が入力されていません。")
    end

    it "is invalid without a status" do
      product = build(:product,status: "",)
      product.valid?
      expect(product.errors[:status]).to include("が入力されていません。")
    end

    it "is invalid without a delivery_fee_owner" do
      product = build(:product,delivery_fee_owner: "",)
      product.valid?
      expect(product.errors[:delivery_fee_owner]).to include("が入力されていません。")
    end
    it "is invalid without a shipping_method" do
      product = build(:product,shipping_method: "",)
      product.valid?
      expect(product.errors[:shipping_method]).to include("が入力されていません。")
    end

    it "is invalid without a delivery_date" do
      product = build(:product,delivery_date: "",)
      product.valid?
      expect(product.errors[:delivery_date]).to include("が入力されていません。")
    end

    it "is invalid without a prefecture" do
      product = build(:product,prefecture: "",)
      product.valid?
      expect(product.errors[:prefecture]).to include("が入力されていません。")
    end

  end
end


