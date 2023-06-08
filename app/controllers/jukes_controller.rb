class JukesController < ApplicationController

  def index
    if params.has_key?("address")
      results = Geocoder.search(params["address"])
      current_location = results.first.data["geometry"]["location"]
      response = GenieService.new(current_location).playlists
      playlists_response = JSON.parse(response.body, symbolize_names: true)
      @playlists = playlists_response[:data]
    else
      results = request.location
      current_location = results.first.data["geometry"]["location"]
      response = GenieService.new(current_location).playlists
      playlists_response = JSON.parse(response.body, symbolize_names: true)
      @playlists = playlists_response[:data]
    end
  end

  
end