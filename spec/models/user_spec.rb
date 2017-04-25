require 'spec_helper'

describe "User" do
	before do
		@city1 = City.create(:name => "Sydney")
		@city2 = City.create(:name => "Melbourne")

		@country1 = Country.create(:name => "Australia")
		@country2 = Country.create(:name => "England")

		@user = User.create(:name => "Mary", :email => "mary@gmail.com", :password => "mary_007")
	end
	
	it "has a name, an email and a password" do
		expect(@user.name).to eq("Mary")
		expect(@user.email).to eq("mary@gmail.com")	
		expect(@user.password).to eq("mary_007")
	end
	
	it "has many countries" do
		@user.countrys << @country1
		@user.countrys << @country2
		expect(@user.countrys).to include(@country1)
		expect(@user.countrys).to include(@country2)
	end
	
	it "has many cities through countries" do
		@user.cities << @city1
		@user.cities << @city2
		expect(@user.citys).to include(@city1)
		expect(@user.citys).to include(@city2)
	end		
end