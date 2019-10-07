# frozen_string_literal: true

require './config/environment'

# routes and configurations
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
  end

  get '/' do
    erb :home
  end

  get '/new_review' do
    erb :new_review
  end

  post '/review' do
    @title = params[:title]
    @director = params[:director]
    @fav_character = params[:fav_character]
    @description = params[:description]
    @rating = params[:rating]
    erb :review
  end

  post '/sessions' do
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect :users/home
    else
      redirect :/
    end
  end

  get '/registrations/signup' do
    erb :'registrations/signup'
  end

  post '/registrations' do
    @user = User.new(name: params['name'], email: params['email'], password: params['password'])
    @user.save
    session[:user_id] = @user.id
    redirect :'users/home'
  end
end
