require './config/environment'

class CollegeController < ApplicationController

  get '/' do
    erb :welcome
  end

  get '/colleges/new' do
    if logged_in?
      erb :'colleges/create_college'
    else
      redirect '/login'
    end
  end


  get '/colleges' do
    erb :'/colleges/index'
# Code this
  end

  post '/colleges' do
# binding.pry
    if logged_in?

      if params[:id] == ""
        redirect '/college/new'
      else
          @college = College.create(params[:id])
          @college.save
      redirect to '/college/show'
    # else
    #   redirect
    #   'students/login'
      end
    end
  end



  # get '/colleges/:id' do
  #   if logged_in?
  #     @college = College.find_by_id(params[:id])
  #     erb :'colleges/show_college'
  #   else
  #     redirect to '/login'
  #   end
  # end
  #
  #
  # get '/colleges/:id/edit' do
  #   if logged_in?
  #     @college = College.find_by_id(params[:id])
  #
  #   if @college && @college.student == current_student
  #     erb :'colleges/edit_college'
  #   else
  #     redirect '/colleges'
  #   end
  #   else
  #   redirect '/login'
  #   end
  # end
  #
  # end

  #
  # put '/colleges/:id' do
  #
  # end
  #
  # delete '/colleges/:id' do
  #
end
