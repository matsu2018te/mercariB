module ApplicationHelper
  #omauth
  def facebook_mock(name, email)
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      provider: 'facebook',
      uid: 1234567890,
      info: {
        name: name,
        email: email
      },
      credentials: {
        token: 'hogepiyo1234'
      }
    )
  end

  OmniAuth.config.test_mode = true
end
