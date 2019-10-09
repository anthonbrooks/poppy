# frozen_string_literal: true

class ReviewsController < ApplicationController
  get '/reviews/new' do
    if !logged_in
      redirect '/'
    else
      erb :'reviews/new'
    end
  end

  post '/reviews/review' do
    @title = params[:title]
    @director = params[:director]
    @fav_character = params[:fav_character]
    @description = params[:description]
    @rating = params[:rating]
    @review = Review.create(params)
    if @review.save
      redirect "/reviews/#{@review.id}"
    else
      redirect '/reviews/new'
    end
  end

  get '/reviews' do
    erb :reviews
  end

  get '/reviews/:id/edit' do
    if !logged_in
      redirect '/'
    else
      if review = current_user.reviews.find_by(params[:id])
        "An edit post form #{current_user.id} is editing #{review.id}"
      else
        redirect '/reviews'
      end
    end
  end

  get '/reviews/:id' do
    @review = Review.find_by(id: params[:id])
    @title = @review.title
    @director = @review.director
    @fav_character = @review.fav_character
    @description = @review.description
    @rating = @review.rating
    if @review
      erb :"reviews/review"
    else
      redirect '/reviews'
    end
  end
end
