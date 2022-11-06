class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    Genre.find(self.genre_id).name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if Drake is *not found*
    Artist.find_or_create_by(name: "Drake")
    Song.create(name: self.name, artist_id: Artist.find_by(name: "Drake").id)
    self.artist_id = Artist.find_by(name: "Drake").id
  end
  end
