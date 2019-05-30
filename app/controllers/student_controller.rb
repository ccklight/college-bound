
require './config/environment'

class StudentController < ApplicationController

  get '/registration' do
    if !logged_in?
      erb :'/student/registration'
    else
      redirect '/login'
    end
  end



  post '/registration' do
    #put binding.pry here and use same name in db and pry to prevent ie using if statement
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      erb :'/student/registration'
    else
      @student = Student.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @student.save
      session[:student_id] = @student.id
      puts params
      redirect  '/college'
      end
  end



  get '/login' do
  if !logged_in?
    erb :'/student/login'
  else
    redirect '/college'
    end
  end



  post '/login' do
    # binding.pry
    @student = Student.find_by(:username => params[:username])
    if @student && @student.authenticate(params[:password])
      session[:student_id] = @student.id
      redirect '/college'
    else
      redirect '/login'
      end
  end



  get '/logout' do
      session.clear
      redirect '/'
  end

end
