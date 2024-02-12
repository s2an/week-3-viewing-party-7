require 'rails_helper'

RSpec.describe "User Registration" do
  it 'can create a user with a name and unique email' do
    visit register_path

    fill_in :user_name, with: 'User One'
    fill_in :user_email, with:'user1@example.com'
    fill_in :user_password, with:'test'
    fill_in :user_password_confirmation, with:'test'
    click_button 'Create New User'

    expect(current_path).to eq(user_path(User.last.id))
    expect(page).to have_content("User One's Dashboard")
  end 

  it 'does not create a user if email isnt unique' do 
    User.create(name: 'User One', email: 'notunique@example.com', password: "test", password_confirmation: "test")
    visit register_path
    
    fill_in :user_name, with: 'User Two'
    fill_in :user_email, with:'notunique@example.com'
    fill_in :user_password, with:'test'
    fill_in :user_password_confirmation, with:'test'
    click_button 'Create New User'
    
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Email has already been taken")
  end
  
  describe "User Story 1" do
    # As a visitor 
    # When I visit `/register`
    # I see a form to fill in my name, email, password, and password confirmation.
    # When I fill in that form with my name, email, and matching passwords,
    # I'm taken to my dashboard page `/users/:id`
  it 'can create a user with a name, unique email, and password' do
    visit register_path
    
    fill_in :user_name, with: 'User One'
    fill_in :user_email, with:'user1@example.com'
    fill_in :user_password, with:'test'
    fill_in :user_password_confirmation, with:'test'
    click_button 'Create New User'
    
    expect(current_path).to eq(user_path(User.last.id))
    expect(page).to have_content("User One's Dashboard")
    end 
  end

  describe "User Story 2" do
    # As a visitor 
    # When I visit `/register`
    # and I fail to fill in my name, unique email, OR matching passwords,
    # I'm taken back to the `/register` page
    # and a flash message pops up, telling me what went wrong
    it "sad path, missing name param" do
      visit register_path
    
      fill_in :user_email, with:'user1@example.com'
      fill_in :user_password, with:'test'
      fill_in :user_password_confirmation, with:'test'
      click_button 'Create New User'
      
      expect(current_path).to eq(register_path)
      expect(page).to have_content("field cannot be blank")
    end
    it "sad path, missing email param" do
      visit register_path
    
      fill_in :user_name, with: 'User One'
      fill_in :user_password, with:'test'
      fill_in :user_password_confirmation, with:'test'
      click_button 'Create New User'
      
      expect(current_path).to eq(register_path)
      expect(page).to have_content("field cannot be blank")
    end

    it "sad path, missing password param" do
      visit register_path
    
      fill_in :user_name, with: 'User One'
      fill_in :user_email, with:'user1@example.com'
      fill_in :user_password_confirmation, with:'test'
      click_button 'Create New User'
      
      expect(current_path).to eq(register_path)
      expect(page).to have_content("field cannot be blank")
    end
  end

  describe "User Story 3" do
    # As a registered user
    # When I visit the landing page `/`
    # I see a link for "Log In"
    # When I click on "Log In"
    # I'm taken to a Log In page ('/login') where I can input my unique email and password.
    # When I enter my unique email and correct password 
    # I'm taken to my dashboard page
    it "does the thangs" do
      @user1 = User.create(name: "User One", email: "user1@test.com", password: "test", password_confirmation: "test")

      visit "/"
      expect(current_path).to eq("/")

      expect(page).to have_button("Log In")
      click_button("Log In")

      expect(current_path).to eq("/login")
      fill_in(:email, with: "user1@test.com" )
      fill_in(:password, with: "test" )
      click_button("Log In")

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content("User One's Dashboard")
    end
  end

  describe "User Story 4" do
    # As a registered user
    # When I visit the landing page `/`
    # And click on the link to go to my dashboard
    # And fail to fill in my correct credentials 
    # I'm taken back to the Log In page
    # And I can see a flash message telling me that I entered incorrect credentials.
    it "sad path, incorrect credentials" do
      @user1 = User.create(name: "User One", email: "user1@test.com", password: "test", password_confirmation: "test")

      visit "/"
      expect(current_path).to eq("/")

      expect(page).to have_button("Log In")
      click_button("Log In")

      expect(current_path).to eq("/login")
      fill_in(:email, with: "user1@test.com" )
      fill_in(:password, with: "test123" )
      click_button("Log In")

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Incorrect password/credentials")
    end
  end

end
