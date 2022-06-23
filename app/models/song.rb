class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres


    def slug
        self.name.downcase.gsub(/[^0-9a-z ]/i, '').gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        Song.all.select{|song| song.slug == slug}.first
    end

end
