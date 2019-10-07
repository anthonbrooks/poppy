class UsersController < ApplicationController
  post '/registration' do
    signup
    redirect '/reviews'
  end
end
