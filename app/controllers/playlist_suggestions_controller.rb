class PlaylistSuggestionsController < ApplicationController
  def index
    @user = User.find_by(spotify_id: session[:user_id])
    @genres = @user.spotify_genres
    response =  GenieService.new(params[:id]).find_playlist
    formatted_response = JSON.parse(response.body, symbolize_names: true)
    @playlist = formatted_response[:data]
  end

  def create
    
  end
end