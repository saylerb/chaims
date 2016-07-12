class Artist

  attr_reader :name, :id, :created_at, :updated_at

  def initialize(new_artist_hash)
    @name = new_artist_hash["name"]
    @id = new_artist_hash["id"]
    @created_at = new_artist_hash["created_at"]
    @updated_at = new_artist_hash["updated_at"]
  end

  def self.all
    artists_hash = ArtistService.new.index
    artists_hash.map do |artist_hash|
      Artist.new(artist_hash)
    end
  end

  def self.find(id)
    artist_hash = ArtistService.new.show(id)
    Artist.new(artist_hash)
  end

  def self.create(artist_hash)
    # How are we going to format the data for the api
    # What fields are requird/optional
    # What HTTP Verb
    # What endpoint?
    artist_hash = ArtistService.new.create(artist_hash)
    Artist.new(artist_hash)

  end
end
