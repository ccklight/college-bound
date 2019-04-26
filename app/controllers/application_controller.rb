require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/' do
    erb :index
  end
  #
  # get '/login' do
  #   erb :'applicants/login'
  # end

  helpers do
    def logged_in?
      !!current_applicant
    end

    def current_applicant
      @current_applicant ||= Applicant.find_by(id: session[:applicant_id]) if session[:applicant_id]
    end
  end
end
