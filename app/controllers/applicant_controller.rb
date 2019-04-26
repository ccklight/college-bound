require './config/environment'
class ApplicantController < ApplicationController


  get '/' do
    erb :welcome
  end

  # get '/applicant/new' do
  #   erb :
  # end

  post '/applicant' do

  end

  get '/applicant/:id' do

  end

  get '/applicant/:id/edit' do

  end
  #
  # patch do
  #
  # end

  put '/applicant/:id' do

  end

  delete '/applicant/:id' do

  end

end
