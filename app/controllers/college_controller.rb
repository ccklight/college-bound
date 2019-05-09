require './config/environment'

class CollegeController < ApplicationController
#
  get '/college' do
    @colleges = College.all
     # Try @ college
    erb :'colleges/index'
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
          @college = College.create(params['id'])
            # Original possily correct is @college = College.create(params[:id])
          @college.save
      redirect '/college/:id'
      # Try this redirect:    redirect  "/colleges/#{@college.id}"
      # OR Try this redirect:    redirect  "/college/#{@college.id}"

#     else
#       redirect 'students/login'
# Update and create in Rails = post
#     post '/recipes' do
#      @college = College.create(params)
#      redirect  "/colleges/#{@college.id}"
#    end
        end
      end
    end


  get '/college/:id' do
        # binding.pry
    if logged_in?
      # @college = College.find_by_id(params[:id])
      # OR try this method:
       @college = College.find_by_id(:params[:id])
      erb :'college/show'
      # OR try this  plural colleges erb:   erb :'colleges/show'
    else
      redirect '/student/registration'
    end
  end


  get '/college/:id/edit' do
    if logged_in?
      @college = College.find_by_id(params[:id])
      # OR try this method:   @college = College.find(params[:id])

    if @college && @college.student == current_student
      erb :'college/edit'
      # OR try plural colleges     erb :'colleges/edit'
    else
      redirect '/login'
      # Look at this: Is this where I want to go?
        end
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
