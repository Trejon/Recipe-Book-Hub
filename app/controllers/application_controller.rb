require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

   helpers do
     def logged_in?
       !!current_user
     end

     def current_user
       @current_user ||= User.find_by(:email => session[:email]) if session[:email]
     end

     def login(email, password)
        user = User.find_by(:email => email)
        if user && user.authenticate(password)
           session[:email] = user.email
       else
         redirect '/login'
       end
     end
   end


     def log_out!
       session.clear
     end
   end
