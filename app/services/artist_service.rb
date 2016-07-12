class ArtistService
  def index
    connection = Faraday.new("http://my-chaimz.herokuapp.com")

    response  = connection.get("/api/v1/artists.json") do |conn|
      conn.headers['Authorization'] = "Bearer 35148ad62db32ff044d6df2cd57"
    end

    JSON.parse(response.body)
  end

  def show(id)
    connection = Faraday.new("http://my-chaimz.herokuapp.com")

    response  = connection.get("/api/v1/artists/#{id}.json") do |conn|
      conn.headers['Authorization'] = "Bearer 35148ad62db32ff044d6df2cd57"
    end

    JSON.parse(response.body)
  end
end
