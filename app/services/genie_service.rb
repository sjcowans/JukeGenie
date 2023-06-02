class GenieService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http//localhost:3000') do |faraday|
    end
  end

  def user
    get_url('/user')
  end
end