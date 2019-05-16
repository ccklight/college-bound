require './config/environment'

class CollegeController < ApplicationController

  get '/college' do
    if logged_in?
    @colleges = College.all
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
    # binding.pry
    if !logged_in? || params[:name] == "" ||  params[:region] == ""

        redirect '/college/new'
        #POSSIBLy redirect to login...think about this
      else
          @college = College.create(name: params[:name], region: params[:region])

        redirect "/college/#{@college.id}"
        end
    end
#IMPORTANT : thus. Need to connect the Student to this particular college.Check in pry @college ==stuent etc.

  get '/college/:id' do
  # binding.pry
    if logged_in?
       @college = College.find_by_id(params[:id])
       erb :'/college/show'
    else
      redirect "/college/#{@college.id}"
    end
  end


  get '/college/:id/edit' do
    # binding.pry Thursday
    if logged_in?
      @college = College.find_by_id(params[:id])
    if  @college && @college.student == current_student
      erb :'college/edit'
    else
      redirect '/college'
        end
      end
    end
#Do checks here in this edit - Thursday


    patch '/college/:id' do
      @college = College.find_by_id(params[:id])
      @college.name = params[:name]
      @college.region = params[:region]
      @college.save
      redirect "/college/#{@college.id}"
    end


    delete '/college/:id' do
      # if logged_in?
      @college = College.find_by_id(params[:id])
      @college.delete
      # erb :'/college/show'
      # erb :'/student/logout'
    redirect '/logout'

    # else
    #   if @college && @college.student == current_student
    #   @college.delete
      # redirect '/student/logout'
      # redirect '/college/show'

    end
end
# Update and create in Rails = post
