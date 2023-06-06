class JukesController < ApplicationController

  def index
    if params.has_key?("address")
      results = Geocoder.search(params["address"])
      current_location = results.first.data["geometry"]["location"]
      #make a call to backend for all playlists, playlists must have automatic geocoding for object based on address input at time of creation
      #Iterate through all playlists and return playlists that are within range based on doing a obj.distance_to([43.9,-98.6]) review on each. 
      # pass the returned playlists to the view with each one as a link to it's playlist dashboard
    else
      results = request.location
      current_location = results.first.data["geometry"]["location"]
    end
  end
end