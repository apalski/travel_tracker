require 'spec_helper'

describe "User" do
	before do
		@city1 = City.create(:name => "Sydney")
		@city2 = City.create(:name => "Melbourne")

		@country1 = Country.create(:name => "Australia")
		@country2 = Country.create(:name => "England")

		@user = User.create(:name => "Mary", :email => "mary@gmail.com", :password => "mary_007")

		@country1.cities << @city1
		@country1.cities << @city2

		@user.countries << @country1
		@user.countries << @country2
	end
	
	it "has a name, an email and a password" do
		expect(@user.name).to eq("Mary")
		expect(@user.email).to eq("mary@gmail.com")	
		expect(@user.password).to eq("mary_007")
	end
	
	it "has many countries" do
		@user.countries << @country1
		@user.countries << @country2
		expect(@user.countries).to include(@country1)
		expect(@user.countries).to include(@country2)
	end
	
	it "has many cities through countries" do
		expect(@user.cities.count).to eq(2)
	end		
end