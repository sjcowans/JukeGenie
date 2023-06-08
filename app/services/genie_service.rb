class GenieService
  def initialize(data=nil)
    @data = data
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://localhost:3001')
  end

  def user
    get_url('/api/v1/users')
  end

  def create_playlist(params)
    response = conn.post do |req|
      req.url '/api/v1/playlists'
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end
  

  def create_user
    conn.post('/api/v1/users') do |req|
      req.headers = {"CONTENT_TYPE" => "application/json"}
      req.params = {user: JSON.parse(@data.to_json)}
    end
  end

  def playlists
    conn.get('api/v1/playlists') do |req|
      req.headers = {"CONTENT_TYPE" => "application/json"}
      req.params = { "lat" => @data["lat"], "lng" => @data["lng"] }
    end
  end

  def create_suggestion(params)
    response = conn.post do |req|
      req.url '/api/v1/suggestions'
      req.headers['Content-Type'] = 'application/json'
      req.body = params
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def populate_playlist(params)
    response = conn.post do |req|
      req.url "/api/v1/playlists/#{params[:playlist_id]}/populate"
      req.headers['Content-Type'] = 'application/json'
      req.params = params
    end
    result = JSON.parse(response.body, symbolize_names: true)
  end

  def find_playlist
    conn.get("/api/v1/playlists/#{@data}")
  end
end