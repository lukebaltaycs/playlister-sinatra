# Add seed data here. Seed your database with `rake db:seed`

Genre.destroy_all
Genre.create(name: "New Age Garbage")
Genre.create(name: "Hippity Hop")
10.times do |example|
    Song.create(name: Faker::Music::Phish.song)
    Artist.create(name: Faker::Name.name)
    Genre.create(name: Faker::Name.name)
end
