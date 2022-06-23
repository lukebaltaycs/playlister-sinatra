class ArtistsController < ApplicationController

    get '/artists' do
        @artists = Artist.all
        erb :'artists/index'
    end

    get '/artist/:id' do
        @artist = Artist.find(params[:id])
        erb :show
    end

    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        erb :'artists/show'
    end

end
