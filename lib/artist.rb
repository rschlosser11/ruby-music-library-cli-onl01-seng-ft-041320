class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song if !self.songs.include?(song)
  end

  def genres
    self.songs.map {|song| song.genre if song.artist == self}.uniq
  end
end
