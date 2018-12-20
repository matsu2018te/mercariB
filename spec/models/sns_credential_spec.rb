require 'rails_helper'
describe 'login via Facebook' do
  let(:user) { User.create(name: 'hoge', email: 'hoge@hoge.com') }


  before do
    OmniAuth.config.mock_auth[:facebook] = nil
    Rails.application.env_config['omniauth.auth'] = facebook_mock(
      email: user.email,
      name: user.name
    )
    click_link 'Facebookを利用してログインする'
  end


  it 'should succeed' do
    expect(page.status_code).to eq 200
  end
end
