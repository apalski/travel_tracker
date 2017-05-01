
class CountryController < ApplicationController

	use Rack::Flash
	
 	get '/countries' do
		@country = Country.all
		erb :'countries/country_index'
	end	

	get '/countries/new' do
		erb :'countries/country_new'
	end	

	post '/countries' do
		if !params[:country_name].empty?
			@country = Country.all.detect {|country| country.name == params[:country_name]}
			if @country != nil && @country.user_id == session[:user_id]
				flash[:message] = "#{params[:country_name]} already exists"
				redirect to "/countries"
			else 
				@country = Country.create(name: params[:country_name], user_id: session[:user_id])	
				redirect to "/countries/#{@country.id}"
			end		
			redirect to "/countries"	
		else
			flash[:message] = "The country was not created, you must enter a country name"
			redirect to "/countries"	
		end	
	end

	get '/countries/:id' do
		@country = Country.find_by_id(params[:id])
		erb :'countries/country_show'
	end	

	post '/countries/:id' do
		@country = Country.find_by_id(params[:id])
		redirect to "/countries/#{@country.id}/edit"
	end	

	get '/countries/:id/edit' do
		@country = Country.find_by_id(params[:id])
		erb :'countries/country_edit'
	end	

	post '/countries/:id/edit' do
		@country = Country.find_by_id(params[:id])
		if !params[:name].empty?
			@country.name = params[:name]
			@country.save
			redirect to "/countries/#{@country.id}"
		else 
			flash[:message] = "#{@country.name} was not edited, you must enter a country name"
			redirect to "/countries"
		end	
	end	

	get '/countries/:id/delete' do
		erb :'countries/country_index'
	end	

	post '/countries/:id/delete' do
		@country = Country.find_by_id(params[:id])
		if @country.cities.size > 0
			flash[:message] = "#{@country.name} has cities attached, please delete #{@country.name}'s cities first"
			redirect to "/countries"
		else
			@country.delete
			redirect to "/countries"
		end	
	end		
end