module AuthenticationHelper
  def sign_in(user)
    session = user.sessions.create!(user_agent: "test", ip_address: "127.0.0.1")
    cookies.signed[:session_id] = { value: session.id, httponly: true }
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelper, type: :controller
end
