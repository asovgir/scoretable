require 'rails_helper'

describe "create new account", :type => :feature do

	#before(:all) do
		#@newuser = User.create(name: 'user0', email: 'user0@example.com', password: 'changeme')
    #@newcat = Category.create(category: 'cat0')
  #end

  it "clicks create account without params" do 
    visit '/users/new'
    click_button 'Create account'
    expect(page).to have_content 'The form contains 5 errors'
  end

  it "clicks create account after filling params" do
  	visit '/users/new'
  	fill_in 'Name', with: 'user2'
  	fill_in 'Email', with: 'user2@example.com'
  	fill_in 'Password', with: 'changeme'
  	fill_in 'Password Confirmation', with: 'changeme'
  	click_button 'Create account'

  	expect(page).to have_content 'Welcome to the betting pit!'
  end
end 

describe "create new category", :type => :feature do
  it "clicks Create Category with no params" do
    visit "/categories/new"
    click_button "Create Category"
    expect(page).to have_content 'Category can\'t be blank'
  end

  it "clicks Create Category with params" do
    visit "/categories/new"
    fill_in 'Category', with: 'Category'
    click_button "Create Category"
    expect(page).to have_content 'Category was successfully created'
  end
end

describe "create new record", :type => :feature do
  it "clicks Create Record with params" do
    visit "/records/new" 
    fill_in 'Wins', with: '1'
    fill_in 'Losses', with: '1'
    click_button "Create Record"
    expect(page).to have_content 'Record was successfully created'
  end
end