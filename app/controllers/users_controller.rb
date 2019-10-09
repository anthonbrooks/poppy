# frozen_string_literal: true

class UsersController < ApplicationController
  get '/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    signup
    posted
  end
end
