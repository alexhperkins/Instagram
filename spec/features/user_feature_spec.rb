require "rails_helper"

describe "pictures" do
  
  context "No pictures have been added" do 

  	it "should display a link to add a picture" do
  		
  		visit '/pictures'

  		expect(page).to have_content('No pictures yet')
  		expect(page).to have_link('Add a picture')	
  	end
  end

  context "Adding a picture" do

  end

end