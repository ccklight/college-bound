require './config/environment'
require_relative './student'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
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
