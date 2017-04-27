require 'spec_helper'

describe CityController do
	before do
		@city1 = City.create(:name => "Sydney")
		@city2 = City.create(:name => "Melbourne")

		@country = Country.create(:name => "Australia")

		@city1.country = @country
		@city2.country = @country

		@country.cities << @city1
		@country.cities << @city2
		@country.save
	end	

	after do
		City.destroy_all
		Country.destroy_all
	end

	describe "/cities" do
		
		it "can visit '/cities'" do
			get '/cities'
			expect(last_response.status).to eq(200)
		end	
			
		it "displays a list of cities and their country" do
			visit "/cities"
			expect(page).to have_content("Sydney")
			expect(page).to have_content("Australia")
		end
	end	
end	