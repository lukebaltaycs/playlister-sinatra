require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash
    


    get '/songs' do
        puts "Hello World"
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        erb :'songs/new'
    end

    post '/songs' do
        @song = Song.create(name: params[:Name])
        if Artist.all.find_by(name: params[:"Artist Name"]).nil?
            Artist.create(name: params[:"Artist Name"])
        end
        params[:genres].each do |genre|
            SongGenre.create(song: @song, genre: Genre.all.find_by(name: genre))
        end
        @song.artist_id = Artist.find_by(name: params[:"Artist Name"]).id
        Artist.all.find_by(name: params[:"Artist Name"]).songs << @song
        @song.save
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get '/songs/:id' do
        @song = Song.find(params[:id])
        erb :show
    end

    get 'songs/:slug/edit' do

        erb :edit
    end

    patch 'songs/:slug' do
       @song =  Song.all.find_by(slug: params[:slug])
    
    redirect to "/songs/#{@song.slug}"
    end

end
