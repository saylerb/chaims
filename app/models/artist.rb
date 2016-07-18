class Artist

  attr_reader :name, :id, :created_at, :updated_at

  def initialize(new_artist_hash)
    @name = new_artist_hash["name"]
    @id = new_artist_hash["id"]
    @created_at = new_artist_hash["created_at"]
    @updated_at = new_artist_hash["updated_at"]
  end

  def self.service
    # memoize the artist service as a class variable
    @@service ||= ArtistService.new
  end

  def self.all
    artists_hash = service.get_artists

    artists_hash.map do |artist_hash|
      Artist.new(artist_hash)
    end
  end

  def self.find(id)
    artist_hash = service.get_artist(id)
    Artist.new(artist_hash)
  end

  def self.create(artist_hash)
    # How are we going to format the data for the api
    # What fields are requird/optional
    # What HTTP Verb
    # What endpoint?
    artist_hash = service.reate(artist_hash)
    Artist.new(artist_hash)
  end

  def update(artist_hash)
  end
end
