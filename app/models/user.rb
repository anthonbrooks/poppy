# frozen_string_literal: true

class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password_digest
  validates :email, uniqueness: true
  has_secure_password
  has_many :reviews
end
