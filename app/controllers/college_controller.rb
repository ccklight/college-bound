require './config/environment'

class CollegeController < ApplicationController

  get '/college' do
    if logged_in?
    @college = College.all
    erb :'college/index'
    end
  end
# Try singular college      erb :'college/index'


  get '/college/new' do
    if logged_in?
      erb :'college/new'
    else
      redirect '/login'
    end
  end



  post '/college' do
    if logged_in?
      if params[:id] == ""
        redirect '/new'
      else
          @college = College.create(params[:id])
          #  @college = College.create(params)
          @college.save
        redirect "/college/#{@college.id}"
    #
    #  else
    #   redirect 'students/login'
    #
    #  end
        end
      end
    end


  get '/college/:id' do
  # binding.pry
    if logged_in?
       @college = College.find_by_id(params[:id])
      erb :'/college/show'
    else
      redirect '/student/registration'
    end
  end


  get '/college/:id/edit' do
    if logged_in?
      @college = College.find_by_id(params[:id])
      @college && @college.student == current_student
      erb :'college/edit'
    else
      redirect '/college/show'
      end
    end


    patch '/college/:id' do
      # Or try plural for route       patch '/colleges/:id' do
      @college = College.find_by_id(params[:id])
      @college.name = params[:name]
      @college.region = params[:region]
      @college.save
      redirect "/college/#{@college.id}"

      # OR try plural college like this:  redirect to "/colleges/#{@college.id}"
    end



    delete '/college/:id' do
      @college = College.find_by_id(params[:id])
      @college.delete
      redirect '/'
    end

end
# Update and create in Rails = post
