require 'spec_helper'

describe CityController do
	before do
		user1 = User.create(:name => "Tom", :email => "tom@gmail.com", :password => "socks")
		@country = Country.create(:name => "Australia", :user_id => 1)
		@city1 = City.create(:name => "Sydney", :country_id => 1)
		@city2 = City.create(:name => "Melbourne", :country_id => 1)
		@country.cities << @city1
		@country.cities << @city2
		@country.save

		visit '/'
		@id = user1.id
		page.click_link("Log In Here", :href => "/users/login")
		fill_in :name, :with => "Tom"
		fill_in :password, :with => "socks"
		click_button "Log In"
	end	

	after do
		City.destroy_all
		Country.destroy_all
		User.destroy_all
	end

	describe "/cities" do
		it "can visit '/cities'" do
			get '/cities'
			expect(last_response.status).to eq(200)
		end	
	end	
end	

