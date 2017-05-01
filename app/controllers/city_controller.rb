
class CityController < ApplicationController

	use Rack::Flash

	get '/cities' do
		@city = City.all
		@country = Country.all
		erb :'cities/city_index'
	end	

	get '/cities/new' do
		erb :'cities/city_new'
	end	

	post '/cities' do
		if !params[:city_name].empty?
			if !params[:country_name].empty?
				@city = City.all.detect {|city| city.name == params[:city_name]}
				@user = User.all.detect {|user| user.id == session[:user_id]}
				if @city != nil && @city.country.user_id == session[:user_id]
					flash[:message] = "#{@city.name} already exists!"
					redirect to "/cities"
				else	
					@city = City.create(name: params[:city_name])
				end	
				@country = Country.all.detect {|country| country.name == params[:country_name]}
				if @country != nil && @country.user_id == session[:user_id]
					@country 
				else 
					@country = Country.create(name: params[:country_name], user_id: session[:user_id])	
				end	
				@city.country = @country
				@country.cities << @city
				@city.save
				redirect to "/cities/#{@city.id}"
			else
				flash[:message] = "City not created you must enter a country name"
				redirect to "/cities"	
			end	
		else
			flash[:message] = "City not created you must enter a city name"
			redirect to "/cities"
		end
	end			

	get '/cities/:id' do
		@city = City.find_by_id(params[:id])
		erb :'cities/city_show'
	end	

	post '/cities/:id' do
		@city = City.find_by_id(params[:id])
		redirect to "/cities/#{@city.id}/edit"
	end	

	get '/cities/:id/edit' do
		@city = City.find_by_id(params[:id])
		erb :'cities/city_edit'
	end	

	post '/cities/:id/edit' do
		@city = City.find_by_id(params[:id])
		if !params[:name].empty?
			@city.name = params[:name]
			@city.save
			redirect to "/cities/#{@city.id}"
		else 
			flash[:message] = "#{@city.name} was not edited, you must enter the new city name"
			redirect to "/cities"
		end	
	end	

	get '/cities/:id/delete' do
		erb :'cities/city_index'
	end	

	post '/cities/:id/delete' do
		@city = City.find_by_id(params[:id])
		@city.delete
		redirect to "/cities"
	end	
end