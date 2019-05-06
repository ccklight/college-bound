require './config/environment'

class StudentController < ApplicationController

  get '/registration' do
    if !logged_in?
      erb :'student/registration'
    else
      redirect '/college'
    end
  end


  post '/registration' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/registration'
    else
# binding.pry
      @student = Student.new(:username => params[:username], :email => params[:email], :password => params[:password])
      # @student = Student.new(username: params['username'], email: params['email'], password: params['password'])
      @student.save
      session[:student_id] = @student.id
      redirect  '/student/login'
      end
  end


  get '/student/login' do
  if logged_in?
    erb :student/login
  else
    redirect '/student/registration'
  end
  end


  post '/student/login' do
    student = Student.find_by(:username => params[:username])
    if student && student.authenticate(params[:password])
      session[:student_id] = student.id
      redirect '/colleges'
    else
      redirect 'student/registration'
    end
  end


  get '/student/logout' do
      session.clear
      redirect '/student/logout'
    end




end
