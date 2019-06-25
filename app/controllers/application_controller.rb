require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end


  get '/' do
    erb :welcome

  end


  helpers do
    def logged_in?
      !!current_student
    end



def find_college_by_id(id)
  @college = College.find_by_id(id)
end


    def redirect_if_not_logged_in
      if !logged_in?
      redirect '/login'
        end
    end


    def current_student
      @current_student ||= Student.find_by(id: session[:student_id]) if session[:student_id]
    end
  end
end
