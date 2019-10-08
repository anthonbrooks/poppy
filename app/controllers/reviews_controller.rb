# frozen_string_literal: true

class ReviewsController < ApplicationController
  get '/new_review' do
    if !logged_in
      redirect '/'
    else
      erb :new_review
    end
  end

  post '/review' do
    @title = params[:title]
    @director = params[:director]
    @fav_character = params[:fav_character]
    @description = params[:description]
    @rating = params[:rating]
    erb :review
  end

  get '/reviews/:id/edit' do
    if !logged_in
      redirect '/'
    else
      'edit post form'
    end
  end

  get 'reviews/:id' do
    @review = Review.find_by(id: params[:id])
    if @review
      erb :review
    else
      redirect '/reviews'
    end
  end

  get '/reviews' do
    erb :reviews
  end
end
