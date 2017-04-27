
class CityController < ApplicationController

	get '/cities' do
		@city = City.all
		erb :'cities/city_index'
	end	

	get '/cities/new' do
		erb :'cities/city_new'
	end	

	post '/cities/new' do
		if !params[:name].empty?
			City.create(name: params[:name])
			redirect to "/cities"
		else
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
			redirect to "/cities"
		end	
	end	

	post '/cities/:id/delete' do
		@city = City.find_by_id(params[:id])
		@city.delete
		redirect to "/cities"
	end	
end