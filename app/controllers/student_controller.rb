require './config/environment'
class StudentController < ApplicationController


  get '/registration' do
    if !logged_in?
      erb :'/student/registration'
    else
      redirect '/colleges'
    end
  end


  post '/registration' dox
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect 'student/registration'
    else
      @student = Student.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @student.save
      session[:student_id] = @student.id
      redirect  '/colleges'
      end
  end



  get '/login' do
    if logged_in?
      erb :'show'

    else
      redirect 'student/registration'

    end
  end

  post '/login' do
    applicant = Applicant.find_by(:username => params[:username])
    if applicant && user.authenticate(params[:password])
      session[:applicant_id] = applicant.id
      redirect '/colleges'
    else
      redirect 'student/registration'
    end
  end




end
