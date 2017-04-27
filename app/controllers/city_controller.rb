
class CityController < ApplicationController

	get '/cities' do
		@city = City.all
		erb :'cities/city_index'
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
		@city.name = params[:name]
		@city.save
		redirect to "/cities/#{@city.id}"
	end	
end