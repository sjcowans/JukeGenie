class PlaylistsController < ApplicationController

  def index
    if params.has_key?("address")
      results = Geocoder.search(params["address"])
      current_location = results.first.data["geometry"]["location"]
      response = @service.playlists
      playlists_response = JSON.parse(response.body, symbolize_names: true)
      @playlists = playlists_response[:data]
    else
      results = request.location
      current_location = results.first.data["geometry"]["location"]
      response = @service.playlists
      playlists_response = JSON.parse(response.body, symbolize_names: true)
      @playlists = playlists_response[:data]
    end
  end

  def new
    @user = User.find_by(spotify_id: session[:user_id])
  end
  
  def create
    service = GenieService.new
    response = service.create_playlist(params)
    playlist_id = response[:data][:id]
    redirect_to dashboard_playlist_path(playlist_id)
  end
  
  def show
    @user = User.find_by(spotify_id: session[:user_id])
    response =  GenieService.new(params[:id]).find_playlist
    formatted_response = JSON.parse(response.body, symbolize_names: true)
    @playlist = formatted_response[:data]
  end

  private

    def playlist_params
      params.require(:playlist).permit(:name, :host_id, :range, :input_address)
    end
end