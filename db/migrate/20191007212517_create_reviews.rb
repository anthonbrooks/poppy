# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :director
      t.string :fav_character
      t.string :description
      t.integer :rating
    end
  end
end
