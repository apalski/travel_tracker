
class UserController < ApplicationController

	use Rack::Flash

	get '/users/signup' do
    if Helpers.is_logged_in?(session)
      flash[:message] = "You are already registered for Travel Tracker!"
      redirect to '/'
    end
    erb :'/users/user_create'
  end

  post '/users' do
    if !params[:name].empty? 
      if !params[:email].empty?
        if !params[:password].empty?
          user = User.create(params)
          session["user_id"] = user.id
          redirect to '/'
        else
          flash[:message] = "You must enter a password to sign up"
          redirect to 'users/signup'
        end  
      else
        flash[:message] = "You must enter an email address to sign up"
        redirect to 'users/signup'
    else
      flash[:message] = "You must enter a user name to sign up!"
      redirect to 'users/signup'
    end
  end

  get '/users/login' do
    if Helpers.is_logged_in?(session)
      flash[:message] = "You are already logged in!"
      redirect to '/'
    end
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
  	if user 
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect to "/"
      else
        flash[:message] = "Your password was incorrect, please try again"
        redirect to "/users/login"
      end
    else
      flash[:message] = "You must be a registered Travel Tracker to use the app, please sign up"
      redirect to 'users/signup' 
	end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if !@user.nil?
      erb :'/users/user_tweets'
    else 
      redirect to '/login'
    end
  end      

  get '/logout' do
    if Helpers.is_logged_in?(session)
      session.clear
    else
      redirect to '/'
    end
    redirect to '/login'
  end

end