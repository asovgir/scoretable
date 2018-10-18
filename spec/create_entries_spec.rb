require 'rails_helper'

describe "creating new account", :type => :feature do

	#before :each do
		#User.create(name: 'user1', email: 'user1@example.com', password: 'changeme')
	#end

    it "clicks create account without params" do 
      visit '/users/new'
      click_button 'Create account'
      expect(page).to have_content 'The form contains 5 errors'
    end

    it "clicks create account after filling params" do
    	visit '/users/new'
    	fill_in 'Name', with: 'user1'
    	fill_in 'Email', with: 'user1@example.com'
    	fill_in 'Password', with: 'changeme'
    	fill_in 'Password Confirmation', with: 'changeme'
    	click_button 'Create account'

    	expect(page).to have_content 'Welcome to the betting pit!'
    end

end 