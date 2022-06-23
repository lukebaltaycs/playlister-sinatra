class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        self.name.downcase.gsub(/[^0-9a-z ]/i, '').gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        Genre.all.select{|genre| genre.slug == slug}.first
    end

end
