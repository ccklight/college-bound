require './config/environment'
class ApplicantController < Application Controller

  get '/' do
    erb :index 

  helpers do

    def logged_in?
      !!current_user
    end



end





end
