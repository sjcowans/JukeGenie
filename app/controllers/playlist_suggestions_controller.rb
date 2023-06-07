class PlaylistSuggestionsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @genres = @user.spotify_genres
  end
end