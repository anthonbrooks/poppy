# frozen_string_literal: true

class SessionsController < ApplicationController
  post '/sessions' do
    login
    redirect '/users/home'
  end

  get '/logout' do
    logout
    redirect '/reviews'
  end
end
