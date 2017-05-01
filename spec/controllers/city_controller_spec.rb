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
		visit '/cities'
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

	describe "/cities/new"
		it "can create a new city and associate it to its country" do
			visit '/cities/new'
			fill_in :city_name, :with => "Lima"
			fill_in :country_name, :with => "Peru"
			click_button "Create City"
			expect(City.all.count).to eq(3)
			expect(City.all[2].name).to eq("Lima")

		end	

		it 'can associate the new city with its user through its country' do
		end	
end	