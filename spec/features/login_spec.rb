require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do 
    user1 = User.create(name: "User One", email: "user1@test.com", password: "test", password_confirmation: "test")
    user2 = User.create(name: "User Two", email: "user2@test.com", password: "test", password_confirmation: "test")
  end
  
  describe "User Story 1" do
    # As a user
    # when I go to the login page (/login)
    # Under the normal login fields (username, password)
    # I also see a text input field for "Location"
    # When I enter my city and state in this field (e.g. "Denver, CO")
    # and successfully log in
    # I see my location on the landing page as I entered it.
    
    # Then, when I log out and return to the login page
    # I still see my location that I entered previously 
    # already typed into the Location field.
    
    it "Implements a Cookie" do
      visit '/login'

    end
  end
end
