# frozen_string_literal: true

class UsersController < ApplicationController
  get '/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    signup
    redirect '/users/home'
  end
end
