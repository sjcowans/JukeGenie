require 'rails_helper'

RSpec.describe User do

  it 'exists' do
    attrs = {
      username: 'Ollie',
      email: "herbert@gmail.com",
      token: 'afosdijfasldkfmals;dkfmaosdim',
      spotify_id: "asdlfkjasdofij" 
    }

    user = User.new(attrs)
    expect(user).to be_a User
    expect(user.username).to eq("Ollie")
    expect(user.email).to eq("herbert@gmail.com")
    expect(user.token).to eq("afosdijfasldkfmals;dkfmaosdim")
    expect(user.spotify_id).to eq("asdlfkjasdofij")
  end
end