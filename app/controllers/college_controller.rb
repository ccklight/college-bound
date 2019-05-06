require './config/environment'

class CollegeController < ApplicationController

  get '/' do
    erb :welcome
  end


  get '/colleges' do
    @colleges = College.all
    erb :'index' #This'index' is the "General Index"
  end


  get '/colleges/new' do
    if logged_in?
      erb :'colleges/new'
    else
      redirect '/student/login'
    end
  end


  post '/colleges' do  #creates a college
    # binding.pry
    if logged_in?
      if params[:id] == ""
        redirect '/college/new'
      else
          @college = College.create(params[:id])
          @college.save
      redirect to '/college/show'
    # else
    #   redirect 'students/login'

    # post '/recipes' do
   #   @college = College.create(params)
   #   redirect  "/colleges/#{@college.id}"
   # end

      end
    end
  end

  get '/colleges/:id' do
    if logged_in?
      @college = College.find_by_id(params[:id])
      erb :'colleges/show'
    else
      redirect '/login'
    end
  end


  get '/colleges/:id/edit' do #loads edit form
    if logged_in?
      @college = College.find_by_id(params[:id])

    if @college && @college.student == current_student
      erb :'colleges/edit'
    else
      redirect '/colleges'
    end
    else
    redirect '/login'
        end

    end



  patch '/colleges/:id' do  #updates a college
   @college = College.find_by_id(params[:id])
   @college.name = params[:name]
   @college.region = params[:region]
   @college.save
    redirect "/colleges/#{@college.id}"
 end


 delete '/colleges/:id' do #destroy action
   @college = College.find_by_id(params[:id])
   @college.delete
   redirect '/colleges'
 end


end
