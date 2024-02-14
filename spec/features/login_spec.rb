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

  describe "User Story 2" do
    # As a user
    # when I log in successfully
    # and then leave the website and navigate to a different website entirely,
    # Then when I return to *this* website, 
    # I see that I am still logged in.
    
    it "Remembers a user upon successful log in/registration" do

    end
  end

  describe "User Story 3" do
    # As a logged-in user 
    # When I visit the landing page
    # I no longer see a link to Log In or Create an Account
    # But I only see a link to Log Out.
    # When I click the link to Log Out,
    # I'm taken to the landing page
    # And I see that the Log Out link has changed back to a Log In link
    # And I still see the Create an Account button.
    it "Logs out a User" do
    
    end
  end

  describe "User Story 4" do
    # As a visitor
    # When I visit the landing page
    # I do not see the section of the page that lists existing users
    it "Logged-out users see limited info on Landing Page" do
      
    end
  end

  describe "User Story 5" do
    # As a logged-in user
    # When I visit the landing page 
    # The list of existing users is no longer a link to their show pages
    # But just a list of email addresses
    it "Logged-in users no longer see links on Landing Page" do
      
    end
  end

  describe "User Story 6" do
    # As a visitor
    # When I visit the landing page
    # And then try to visit the user's dashboard ('/users/:user_id')
    # I remain on the landing page
    # And I see a message telling me that I must be logged in or registered to access a user's dashboard.
    it "Dashboard Authorization" do
      
    end
  end
  
  describe "User Story 7" do
    # As a visitor
    # If I go to a movies show page ('/users/:user_id/movies/:movie_id')
    # And click the button to Create a Viewing Party
    # I'm redirected back to the movies show page, and a message appears to let me know I must be logged in or registered to create a Viewing Party.
    it "Creates a Viewing Party Authorization" do 
      
    end
  end
end
