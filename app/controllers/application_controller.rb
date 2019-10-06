# frozen_string_literal: true

require './config/environment'

# routes and configurations
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :welcome
  end

  get '/new_review' do
    erb :new_review
  end

  post '/review' do
    @title = params[:title]
    @director = params[:director]
    @fav_character = params[:fav_character]
    @description = params[:description]
    erb :review
  end
end
