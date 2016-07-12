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
    
    artists_hash = ArtistService.new.index
    result = artists_hash.find do |artist_hash|
      artist_hash['id'] == id.to_i
    end
    Artist.new(result)
  end
end
