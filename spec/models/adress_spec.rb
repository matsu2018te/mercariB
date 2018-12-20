require 'rails_helper'

describe Address do
  describe '#create' do
    it "is valid with postal_code, prefecture, municipality, address_number" do
      user = build(:user)
      address = build(:address)
      expect(address).to be_valid
    end

    # it "is invalid without postal_code" do
    # user = build(:address, postal_code: "")
    # user.valid?
    # expect(user.errors[:postal_code]).to include("を入力してください")
    # end

    # it "is invalid without postal_code" do
    # user = build(:address, postal_code: "")
    # user.valid?
    # expect(user.errors[:postal_code]).to include("を入力してください")
    # end

    # it "is invalid without postal_code" do
    # user = build(:address, postal_code: "")
    # user.valid?
    # expect(user.errors[:postal_code]).to include("を入力してください")
    # end

    # it "is invalid without postal_code" do
    # user = build(:address, postal_code: "")
    # user.valid?
    # expect(user.errors[:postal_code]).to include("を入力してください")
    # end



  end
end
