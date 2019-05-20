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



    patch '/college/:id' do
      if @college = College.find_by_id(params[:id])
         @college.name = params[:name]
         @college.region = params[:region]
      @college.save
        erb :'/college/edit'
    else
        redirect "/college/#{@college.id}"

      @college = college.find(params[:id])
      @college.delete(params[:college])
    end
  end



    delete '/college/:id' do
      @college = College.find_by_id(params[:id])
      @college.delete
    redirect '/college'
    end
end
