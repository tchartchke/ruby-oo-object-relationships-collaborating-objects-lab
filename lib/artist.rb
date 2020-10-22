class Artist

  attr_accessor :name

  # attr_reader :songs #getter for all the songs. ALL OF THEM.
  # attr_writer :song_list #setter for all the songs. ALL OF THEM.

  @@all = []

  def initialize(name)
    self.name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.find_all{|song| song.artist == self}
  end

  def self.find_or_create_by_name(artist_name)
    this_artist = self.all.find() { |artist| artist.name = artist_name }
    this_artist ? this_artist : Artist.new(artist_name)
  end

  def print_songs
    songs.each { |song| puts song.name }
  end
end