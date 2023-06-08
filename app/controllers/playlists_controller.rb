class PlaylistsController < ApplicationController

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

  def new
    @user = User.find_by(spotify_id: session[:user_id])
  end
  
  def create
    service = GenieService.new
    if params[:join_code] == nil
      response = service.create_playlist(params)
      formatted_response = JSON.parse(response.body, symbolize_names: true)
      playlist_id = formatted_response[:data][:id]
      redirect_to dashboard_playlist_suggestions_path(playlist_id)  
    else
      response = service.create_user_playlist(params)
      playlist_id = response[:data][:id]
      redirect_to dashboard_playlist_suggestions_path(playlist_id)  
    end
  end
  
  
  def show
    @user = User.find_by(spotify_id: session[:user_id])
    response =  GenieService.new(params[:id]).find_playlist
    formatted_response = JSON.parse(response.body, symbolize_names: true)
    @playlist = formatted_response[:data]
  end

  def populate
    service = GenieService.new(suggestions_params[:playlist_id])
    
    if !(suggestions_params[:artist] || suggestions_params[:genre] || suggestions_params[:song])
      artists = [suggestions_params[:artist1], suggestions_params[:artist2], suggestions_params[:artist3]]
      songs = [suggestions_params[:song1], suggestions_params[:song2], suggestions_params[:song3]]
      genres = [suggestions_params[:genre1], suggestions_params[:genre2], suggestions_params[:genre3]]
    else
      artists = [params[:artist]]
      songs = [params[:song]]
      genres = [params[:genres]]
    end
    # require 'pry'; binding.pry

    [artists, songs, genres].each_with_index do |seed_array, enum|
      seed_type = case enum
      when 0
        'artist'
      when 1
        'track'
      when 2
        'genre'
      end

      seed_array.each do |seed|
        next if !seed.present?
        suggestion_params = {
          user_id: suggestions_params[:user_id],
          playlist_id: suggestions_params[:playlist_id],
          seed_type: seed_type,
          request: seed
        }.to_json

        result = service.create_suggestions(suggestion_params)
      end
    end
    
    populate_params = {
      playlist_id: suggestions_params[:playlist_id],
      spotify_id: suggestions_params[:spotify_id],
      host_id: suggestions_params[:user_id]
    }
    
    result = service.populate_playlist(populate_params)
    redirect_to dashboard_playlist_path(suggestions_params[:playlist_id])
  end
  
  def search
    @user = User.find(params[:id])
  end

  private

  def suggestions_params
    params.permit(:name, :playlist_id, :user_id, :spotify_id, :range, :input_address, 
                  :artist, :artist1, :artist2, :artist3, 
                  :song, :song1, :song2, :song3, 
                  :genre, :genre1, :genre2, :genre3)
  end

  def playlist_params
    params.require(:playlist).permit(:name, :host_id, :range, :input_address)
  end
end