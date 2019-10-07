class SessionsController < ApplicationController  
  post '/sessions' do
    login
    redirect '/reviews'
  end

  get '/logout' do
    logout
    redirect '/reviews'
  end
end
