# frozen_string_literal: true

require './config/environment'

# routes and configurations
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'password_secret'
  end

  get '/' do
    if !logged_in
      erb :home
    else
      redirect 'users/home'
    end
  end

  get '/users/home' do
    @user = User.find_by(id: session[:user_id])
    erb :'users/home'
  end

  helpers do
    def logged_in
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def signup
      @user = User.new(name: params[:name], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
    end

    def login
      @user = User.find_by(email: params[:email])
      if @user&.authenticate(params[:password])
        session[:user_id] = @user.id
      else
        redirect '/'
        @invalid = 'Please enter valid credentials'
      end
    end

    def logout
      session.clear
    end
  end
end
