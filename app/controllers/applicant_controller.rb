require './config/environment'
class ApplicantController < Application Controller


  helpers do

    def logged_in?
      !!current_user
    end

  

end





end
