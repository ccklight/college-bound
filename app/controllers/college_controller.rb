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



  get '/college/:id/edit' do
    if logged_in?
      @college = College.find_by_id(params[:id])
    if  @college && @college.student == current_student
      erb :'/college/edit'
    else
      redirect '/college/new'
        end
      end
    end



    patch '/college/:id' do
         @college.student == current_user
      if @college && @college.student == current_student
         @college = College.find_by_id(params[:id])
         @college.name = params[:name]
         @college.region = params[:region]
         @college.save
        redirect "/college/#{@college.id}"
      else
        redirect '/college'

    end
  end
***********
FWITTER
patch '/tweets/:id' do
    if logged_in?
      if params[:content] == ""
          redirect "/tweets/#{params[:id]}/edit"
    else
        @tweet = Tweet.find_by_id(params[:id])
    if @tweet && @tweet.user == current_user
        if @tweet.update(content: params[:content])
          redirect "/tweets/#{@tweet.id}"
    else
          redirect "/tweets/#{@tweet.id}/edit"
          end
    else
          redirect '/tweets'
        end
    end
    else
          redirect '/login'
        end
    end
***********


    delete '/college/:id' do
      @college.student == current_user
      @college = College.find_by_id(params[:id])
      if @college && @college.student == current_student
      @college.delete
    redirect '/college'
    end
  end
************
FWITTER
delete '/tweets/:id/delete' do
      if logged_in?
        @tweet = Tweet.find_by_id(params[:id])
      if @tweet && @tweet.user == current_user
        @tweet.delete
      end

        redirect '/tweets'
      else
        redirect '/login'
      end
    end

*************

end
