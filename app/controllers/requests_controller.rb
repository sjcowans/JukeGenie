class RequestsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @genres = @user.spotify_genres
  end
end