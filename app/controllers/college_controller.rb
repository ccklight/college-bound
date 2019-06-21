require './config/environment'

class CollegeController < ApplicationController

  get '/college' do
    redirect_if_not_logged_in
    @colleges = College.all
    erb :'college/index'
  end



  get '/college/new' do
   redirect_if_not_logged_in
      erb :'/college/new'
  end



  post '/college' do
      if !logged_in? || params[:name] == "" ||  params[:region] == ""
        redirect '/college/new'
      else
        @college = College.create(name: params[:name], region: params[:region])
        @college.student = current_student
        @college.save
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



  get '/college/:id/edit' do
    if logged_in?
      @college = College.find_by_id(params[:id])
    if @college && @college.student == current_student
      erb :'/college/edit'
    else
      redirect '/college/new'
        end
      end
    end


    patch '/college/:id' do
         @college = College.find_by_id(params[:id])
      if @college && @college.student == current_student

         @college.name = params[:name]
         @college.region = params[:region]
         @college.save
        redirect "/college/#{@college.id}"
      else

        redirect "/college/#{@college.id}/edit"
    end
  end


    delete '/college/:id' do

      @college = College.find_by_id(params[:id])
      if @college && @college.student == current_student
      @college.delete
    redirect  '/college'
      else
    redirect '/college'
    end

  end

end
