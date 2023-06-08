require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "520874d43b894c83ba778171aead16a5", "3e890a3d9785419a8c91d9e9cdfba456", scope: 'user-read-email playlist-modify-public user-library-modify'
end
OmniAuth.config.allowed_request_methods = [:post, :get]