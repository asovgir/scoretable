require 'rails_helper'

describe "creating new account", :type => :feature do

	#before :each do
		#User.create(name: 'user1', email: 'user1@example.com', password: 'changeme')
	#end

    it "clicks test button" do 
      visit '/users/new'
      click_button 'Create account'
    end
end 