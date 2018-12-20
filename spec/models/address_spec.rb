require 'rails_helper'

describe Address do
  describe '#create' do
    it "is valid with postal_code, prefecture, municipality, address_number" do
      user = build(:user)
      address = build(:address)
      expect(address).to be_valid
    end
  end
end
