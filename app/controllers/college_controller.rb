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
    if !logged_in? || params[:name] == "" ||  params[:region] == ""
        redirect '/college/new'
      else
        @college = College.create(name: params[:name], region: params[:region])
        redirect "/college/#{@college.id}"
        end
    end



  get '/college/:id' do
    if logged_in?
       @college = College.find_by_id(params[:id])
       erb :'/college/show'
    else
      redirect "/college/#{@college.id}"
      end
  end



  get '/college/:id/edit' do  #load edit form
    if logged_in?
      @college = College.find_by_id(params[:id])
    if  @college || @college.student == current_student
      erb :'/college/edit'
    else
      redirect '/college/new'
        end
      end
    end
#Might need to add disallow editing if not current_student


    patch '/college/:id' do
      if @college = College.find_by_id(params[:id])
         @college.name = params[:name]
         @college.region = params[:region]
      @college.save
        redirect "/college/#{@college.id}"
      else
        redirect '/college'

    end
  end

# if !params[:student].keys.include?("college_ids")
#   params[:student]["college_ids"] = []
# end




    delete '/college/:id' do
      # if !params[:student].include?("college_ids")
      if
        # @student == current_student[:session_id]
      @college = College.find_by_id(params[:id])
      @college.delete
    redirect '/college'
    end
  end
end
#Might need to add disallow if not current student
