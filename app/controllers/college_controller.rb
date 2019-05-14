require './config/environment'

class CollegeController < ApplicationController

  get '/college' do
    if logged_in?
    @college = College.all
    erb :'college/index'
    end
  end


  get '/college/new' do
    if logged_in?
      erb :'college/new'
    else
      redirect '/login'
    end
  end



  post '/college' do
    if logged_in? && params[:id] == ""
        erb :'/college/new'
      else
          @college = College.create(params[:id])
          @college.save #Might night be needed
        # redirect "/college/#{@college.id}"
        redirect "/college/#{@college.id}"

        #/college/#{@college.id} is my Show page
#Redirect '/college/#{college.id}'sends to get /college/:id
      end
    end


  get '/college/:id' do
  # binding.pry
    if logged_in?
       @college = College.find_by_id(params[:id])
       erb :'/college/show'

    #   erb :'/college/index'
    #erb :'/college/show'
    else
      # redirect 'student/registration'
      redirect "/#{@college.id}"
    end
  end


  get '/college/:id/edit' do
    if logged_in?
      @college = College.find_by_id(params[:id])
      @college && @college.student == current_student
      erb :'college/show'
    else
      redirect '/college/""/edit'
      end
    end


    patch '/college/:id' do
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
