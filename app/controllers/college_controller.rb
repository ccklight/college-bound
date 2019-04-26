require './config/environment'
class CollegeController < ApplicationController

  get '/' do
    erb :welcome
  end

  get '/colleges'/new do
    if logged_in?
      erb :'colleges/create_college'
    else
      redirect to '/login'
    end
  end

  post '/colleges' do
    if logged_in?

    redirect to 'applicants/login'
  end

  get '/colleges/:id' do
    if logged_in?
      @college = College.find_by_id(params[:id])
      erb :'colleges/show_college'
    else
      redirect to '/login'
    end
  end


  get '/colleges/:id/edit' do
    if logged_in?
      @college = College.find_by_id(params[:id])

    if @college && @college.applicant == current_applicant
      erb :'colleges/edit_college'
    else
      redirect '/colleges'
    end
    else
    redirect '/login'
  end

  end


  put '/colleges/:id' do

  end

  delete '/colleges/:id' do

  end

end
