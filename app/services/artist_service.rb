class ArtistService

  def initialize
    @connection = Faraday.new("http://my-chaimz.herokuapp.com")
    @connection.headers['Authorization'] = "Bearer 35148ad62db32ff044d6df2cd57"
  end

  def get_artists
    response  = @connection.get("/api/v1/artists.json")
    parse(response)
  end

  def get_artist(id)
    response  = @connection.get("/api/v1/artists/#{id}.json")
    parse(response)
  end
  
  def post_artist(artist_hash)
    response  = @connection.post("/api/v1/artists?name#{artist_hash['name']}")
    parse(response)
  end

  def patch_artist(artist_hash)
    response  = @connection.patch("/api/v1/artists?name#{artist_hash['name']}")
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
