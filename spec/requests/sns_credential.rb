require 'rails_helper'

describe "#self.from_omniauth" do
  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  let(:auth){
    {
      "provider" => "test_provider",
      "uid" => "test_uid",
      "info" => { "nickname" => "testuser" }
    }
  }
  context "when user is not created" do
    it "succeeded in creating user." do
      expect{ User.find_oauth(auth) }.to change{ User.count }.by(1)
    end
  end
  context "when user has already been created" do
    it "create " do
      user = build(:user)
      expect{ User.find_oauth(auth) }.not_to change{ User.count }
    end
  end
end
