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
    erb :home
  end

  get 'users/home' do
    erb :'users/home'
  end

  helpers do
    def logged_in
      !!session[:user_id]
    end

    def current_user; end

    def signup
      @user = User.new(name: params[:name], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
    end

    def login
      @user = User.find_by(email: params[:email])
      if # frozen_string_literal: true
# routes and configurations
@user&.authenticate(params[:password])
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
