class PlaylistSuggestionsController < ApplicationController
  def index
    @user = User.find_by(spotify_id: session[:user_id])
    @genres = @user.spotify_genres
    response =  GenieService.new(params[:playlist_id]).find_playlist
    formatted_response = JSON.parse(response.body, symbolize_names: true)
    @playlist = formatted_response[:data]
  end

  def create
    
  end

  def suggestion_form
    @user = User.find_by(spotify_id: session[:user_id])
    @genres = @user.spotify_genres
    response =  GenieService.new(params[:playlist_id]).find_playlist
    formatted_response = JSON.parse(response.body, symbolize_names: true)
    @playlist = formatted_response[:data]
  end

  def create_suggestion
    @data = { }
    if params.has_key?("artists")
      @data[:user_id] = params["user_id"]
      @data[:playlist_id] = params["playlist_id"]
      @data[:seed_type] = "artist"
      @data[:request] = params["artists"]
    elsif params.has_key?("songs")
      @data[:seed_type] = "track"
      @data[:request] = params["songs"]
      @data[:user_id] = params["user_id"]
      @data[:playlist_id] = params["playlist_id"]
    else
      genre = []
      selected = []
      params.each do |k,v|
        selected << k if v == "1"
      end
      selected.each do |param|
        genre << param if param.include?("genre:")
      end
      edited_genre = genre.first.gsub("genre:", "")
      @data[:seed_type] = "genre"
      @data[:request] = edited_genre
      @data[:user_id] = params["user_id"]
      @data[:playlist_id] = params["playlist_id"]
    end
    service = GenieService.new(@data)
    response = service.create_suggestion
    formatted_response = JSON.parse(response.body, symbolize_names: true)
    playlist_id = formatted_response[:data][:attributes][:playlist_id]
    redirect_to dashboard_playlist_path(playlist_id)
  end
end