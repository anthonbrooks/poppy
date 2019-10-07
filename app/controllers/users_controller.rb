class UsersController < ApplicationController
  get '/signup' do
    erb :'registrations/signup'
  end
  
  post '/registration' do
    signup
    redirect '/users/home'
  end
end
