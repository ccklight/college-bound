require './config/environment'

class CollegeController < ApplicationController



  get '/colleges' do
    @colleges = College.all
    erb :index #This'index' is the "General Index"
  end


  get '/college/new' do
    if logged_in?
      erb :create
    else
      redirect '/student/login'
    end
  end


  post '/college' do  #creates a college
    # binding.pry
    if logged_in?
      if params[:id] == ""
        redirect '/create'
      else
          @college = College.create(params[:id])
          @college.save
      redirect '/show'
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
      erb :show
    else
      redirect '/student/login'
    end
  end


  get '/college/:id/edit' do #loads edit form
    if logged_in?
      @college = College.find_by_id(params[:id])

    if @college && @college.student == current_student
      erb :edit
    else
      redirect '/student/login'
    end
    # else
    # redirect '/login'
    #     end

    end



  patch '/college/:id' do  #updates a college
   @college = College.find_by_id(params[:id])
   @college.name = params[:name]
   @college.region = params[:region]
   @college.save
    redirect "/college/#{@college.id}"
 end


 delete '/college/:id' do #destroy action
   @college = College.find_by_id(params[:id])
   @college.delete
   redirect '/'
 end


end
