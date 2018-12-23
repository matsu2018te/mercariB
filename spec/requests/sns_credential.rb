require 'rails_helper'

def facebook_mock
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
    {
      provider: 'facebook',
      uid: '12345',
      info: {
        name: 'mockuser',
        email: 'merucari@gmail.com'
      },
    }
  )
end

describe "UserFeature" do
  describe "facebook連携でサインアップする" do
    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock
      visit root_path
    end

    after do
      OmniAuth.config.test_mode = false
    end

    it "サインアップするとユーザーが増える" do
      click_on "新規会員登録"
      expect{
        click_link "Facebookで登録"
      }.to change(User, :count).by(1)
    end

    it "すでに連携されたユーザーがサインアップしようとするとユーザーは増えない" do
      click_on "新規会員登録"
      click_link "Facebookで登録"
      visit mypage_logout_path
      click_link "ログアウト", match: :first
      click_link "ログイン"
      expect{
        click_link "Facebookでログイン"
      }.not_to change(User, :count)
    end
  end
end
