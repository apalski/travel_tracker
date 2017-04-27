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

			it "contains links to countries and cities respective index pages" do
				expect(page).to have_css("a[href='/countries']")
				expect(page).to have_css("a[href='/cities']")
			end	
	end		
end