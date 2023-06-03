class User
  attr_reader :username,
              :email,
              :token,
              :role,
              :spotify_id

  def initialize(attributes)
    @username = attributes[:username]
    @email = attributes[:email]
    @token = attributes[:token]
    @role = attributes[:role]
    @spotify_id = attributes[:spotify_id]
  end
end