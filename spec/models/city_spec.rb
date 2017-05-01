require 'spec_helper'

describe "City" do
	before do
		@city = City.create(:name => "Sydney")

		@country = Country.create(:name => "Australia")

		@user = User.create(:name => "Mary", :email => "mary@gmail.com", :password => "mary_007")

	end

	after do
		City.destroy_all
		Country.destroy_all
		User.destroy_all
	end

	it "has a name" do
		expect(@city.name).to eq("Sydney")
	end
	
	it "belongs to a country" do
		@country.cities << @city
		expect(@city.country).to eq(@country)
	end		
end