require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  # get '/login' do
  #   erb :applicant/login
  # end
  #
  # post '/login do'
  #   erb :'applicant/login'
  # end
  get '/colleges' do
      "Hello World"
    end

    get '/login' do
      if logged_in?
        erb :'student/login'

      else
        redirect '/colleges'

      end
    end



  helpers do
    def logged_in?
      !!current_student
    end

    def current_student
      @current_student ||= Student.find_by(id: session[:student_id]) if session[:student_id]
    end
  end
end
