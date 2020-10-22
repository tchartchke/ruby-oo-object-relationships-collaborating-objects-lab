class Song

  attr_accessor :name
  attr_reader :artist, :artist_name

  @@all = []


  def initialize(name)
    self.name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
  end
  
  def artist_name=(artist_name)
    this_artist = Artist.find_or_create_by_name(artist_name)
    self.artist = this_artist
  end

  def self.new_by_filename(filename)
    artist_name, song_name = filename.split(" - ")

    new_song = Song.new(song_name)
    new_song.artist_name = artist_name

    new_song
  end

end