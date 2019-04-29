require './config/environment'
class StudentController < ApplicationController


  get '/registration' do
    if !logged_in?
      redirect '/student/registration'
    else
      redirect '/colleges'
    end
  end


  post '/registration' do # Creates 1 student
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to 'student/registration'
    else
      @student = Student.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @student.save
      session[:student_id] = @student.id
      redirect to '/colleges'
      end
  end



  get '/login' do
    if logged_in?
      erb :'student/login'

    else
      redirect '/colleges'

    end
  end

  post '/login' do
    applicant = Applicant.find_by(:username => params[:username])
    if applicant && user.authenticate(params[:password])
      session[:applicant_id] = applicant.id
      redirect '/colleges'
    else
      redirect to 'applicant/registration'
    end
  end



end
