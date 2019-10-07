# frozen_string_literal: true

ENV['SINATRA_ENV'] ||= 'development'

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc 'A console to try out the app'
task :console do
  Pry.start
end
