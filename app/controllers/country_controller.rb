
class CountryController < ApplicationController

 	get '/countries' do
		@country = Country.all
		erb :'countries/country_index'
	end	

end