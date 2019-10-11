# frozen_string_literal: true

class ReviewsController < ApplicationController
  get '/reviews/new' do
    if !logged_in
      redirect '/'
    else
      erb :'reviews/new'
    end
  end

  get '/reviews' do
    erb :reviews
  end

  post '/reviews' do
    @title = params[:title]
    @director = params[:director]
    @fav_character = params[:fav_character]
    @description = params[:description]
    @rating = params[:rating]
    @review = current_user.reviews.create(title: @title, director: @director, fav_character: @fav_character, description: @description, rating: @rating)
    if @review.save
      redirect "/reviews/#{ @review.id }"
    else
      redirect '/reviews/new'
    end
  end

  get '/reviews/:id' do
    @review = Review.find_by(id: params[:id])
    erb :'/reviews/show'
  end

  get '/reviews/:id/edit' do
    if !logged_in
      redirect '/'
    else
      @review = current_user.reviews.find_by_id(params[:id])
      if @review
        erb :'/reviews/edit'
      else
        redirect '/reviews'
      end
    end
  end

  patch '/reviews/:id' do
    @review = Review.find_by_id(params[:id])
    @review.update(title: params[:title])
    @review.director = params[:director]
    @review.fav_character = params[:fav_character]
    @review.description = params[:description]
    @review.update(rating: params[:rating])
    @review.save
    redirect "/reviews/#{ @review.id }"
  end

  post '/reviews/:id' do
    @review = Review.find_by_id(params[:id])
    @review.title = params[:title]
    @review.director = params[:director]
    @review.fav_character = params[:fav_character]
    @review.description = params[:description]
    @review.rating = params[:rating]
    @review.save
    redirect "/reviews/#{ @review.id }"
  end
  
  get '/reviews/:id/delete' do
    @review = Review.find_by_id(params[:id])
    erb :'/reviews/delete'
  end
  
  delete '/reviews/:id' do
    @review = Review.find_by_id(params[:id]).destroy
    redirect '/reviews'
  end
end
