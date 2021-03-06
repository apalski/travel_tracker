
class UserController < ApplicationController

	use Rack::Flash

	get '/users/signup' do
    erb :'/users/users_new'
  end

  get '/users' do
    erb :'/users/users_new'
  end  

  post '/users' do
    @user_email = User.all.select {|user| user.email == params[:email]}
    if !params[:name].empty? 
      if !params[:email].empty?
        if !params[:password].empty?
          if Helpers.is_logged_in?(session)
            flash[:message] = "You are already logged in!"
            redirect to '/'
          elsif @user_email.size > 0
            flash[:message] = "You are already a registered user"
            redirect to '/users/login'
          else 
            user = User.create(params)
            flash[:message] = "You have successfully signed-up"
            redirect to '/users/login'
           end 
        else
          flash[:message] = "You must enter a password to sign up"
          redirect to 'users/signup'
        end  
      else
        flash[:message] = "You must enter an email address to sign up"
        redirect to 'users/signup'
      end  
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
    erb :'/users/users_login'
  end

  post '/users/login' do
    @user = User.find_by(:name => params[:name])
  	if @user != nil 
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:message] = "You have successfully logged in to Travel Tracker"
        redirect to "/users/#{@user.id}"
      else
        flash[:message] = "Your password was incorrect, please try again"
        redirect to "/users/login"
      end
    else  
      redirect to '/' 
    end  
	end

  get '/users/logout' do
    if Helpers.is_logged_in?(session)
      session.clear
      redirect to '/users/login'
    else
      flash[:message] = "You are not logged in to logout!"
      redirect to '/users/login'
    end
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    erb :'users/users_show'
  end

  get '/users/:id/edit' do
    @user = User.find_by_id(params[:id])
    erb :'users/users_edit'
  end

  post '/users/:id/edit' do
    @user = User.find_by_id(params[:id])
    if !params[:name].empty?
      @user.name = params[:name]
    end
    if !params[:email].empty?
      @user.email = params[:email]
    end
    if !params[:password].empty?
      @user.password = params[:password]
    end
    @user.save     
    redirect to "/users/#{@user.id}"
  end

  get '/users/:id/delete' do
    erb :'/users/users_new'
  end 

  post '/users/:id/delete' do
    @user = User.find_by_id(params[:id])
    session.clear
    @user.countries.clear
    @user.delete
    flash[:message] = "You are no longer a registered user of Travel Tracker"
    redirect to '/'
  end  
end

