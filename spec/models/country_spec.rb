require 'spec_helper'

describe "Country" do
	before do
		@city1 = City.create(:name => "Sydney")
		@city2 = City.create(:name => "Melbourne")
	
		@country = Country.create(:name => "Australia")

		@user = User.create(:name => "Mary", :email => "mary@gmail.com", :password => "mary_007")
	end
	
	it "has a name" do
		expect(@country.name).to eq("Australia")
	end
	
	it "has many cities" do
		@country.citys << @city1
		@country.citys << @city2
		expect(@country.citys).to include(@city1)
		expect(@country.citys).to include(@city2)
	end		

	it "belongs to a user" do
		@user.countrys << @country
		expect(@country.user).to eq(@user)
	end	
end