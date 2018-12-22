require 'rails_helper'

RSpec.describe omniauth do
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
        expect{ User.find_oauth(request.env["omniauth.auth"]) }.to change{ User.count }.by(1)
      end
    end
    context "when user has already been created" do
      it "create " do
        user = build(:user)
        expect{ User.find_oauth(auth) }.not_to change{ User.count }
      end
    end
  end
end


# describe "facebook login test" do
#     before do
#         OmniAuth.config.test_mode = true
#         FactoryGirl.create(:user)
#         OmniAuth.config.mock_auth[:facebook] = {
#             "uid" => "12311111",
#             "provider" => "facebook",
#             "info" => {
#                 "nickname" => "anonymous"
#             }
#         }
#         visit user_facebook_omniauth_authorize_path
#     end

#     after do
#         OmniAuth.config.test_mode = false
#     end

#     describe "after login" do
#       before{ visit "/mypage/logout" }
#         subject{ page }

#       it{ should have_link('ログアウト') }
#     end
# end
