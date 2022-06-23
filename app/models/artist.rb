class Artist < ActiveRecord::Base
    has_many :song_genres, through: :songs
    has_many :genres, through: :song_genres
    has_many :songs
    
    def slug
        self.name.downcase.gsub(/[^0-9a-z ]/i, '').gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        Artist.all.select{|artist| artist.slug == slug}.first
    end

end
