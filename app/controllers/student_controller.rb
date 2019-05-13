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
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      erb :'student/registration'
    else
# binding.pry
      @student = Student.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @student.save
      session[:student_id] = @student.id
      puts params
      redirect  '/login'

      end
  end


  get '/login' do
  if !logged_in?
    erb :'/student/login'
  else
    redirect '/login'
    end
  end


  post '/login' do
    @student = Student.find_by(:username => params[:username])
    if @student && @student.authenticate(params[:password])
      session[:student_id] = @student.id
      redirect '/college/new'
    else
      redirect '/login'
    end
  end


  get '/logout' do
      session.clear
      erb :'/student/logout'
  end

end
