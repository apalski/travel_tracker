require 'spec_helper'

describe ApplicationController do
	
	describe "Homepage" do
		before do
			visit '/'
		end	
			it 'loads the homepage' do
				get '/'
				expect(last_response.status).to eq(200)
				expect(last_response.body).to include("Welcome to Travel Tracker")
			end

			it "contains links for a user to sign up and log in" do
				expect(page).to have_css("a[href='/users/signup']")
				expect(page).to have_css("a[href='/users/login']")
			end	
	end		
end