require 'rails_helper'

RSpec.describe "session create" do
  it 'can create a session' do
  visit sessions_path(:user_data => {"provider"=>"spotify",
  "uid"=>"zedesia",
  "info"=>
   {"display_name"=>"zedesia",
    "email"=>"zedesia@yahoo.com",
    "external_urls"=>{"spotify"=>"https://open.spotify.com/user/zedesia"},
    "followers"=>{"href"=>nil, "total"=>6},
    "href"=>"https://api.spotify.com/v1/users/zedesia",
    "id"=>"zedesia",
    "images"=>[],
    "type"=>"user",
    "uri"=>"spotify:user:zedesia"},
  "credentials"=>
   {"token"=>
     "123",
    "refresh_token"=>
     "1234",
    "expires_at"=>1686208778,
    "expires"=>true},
  "extra"=>{}})

    expect(page).to have_content('Please activate your account by following the instructions in the account confirmation email you received to proceed')
  end
end