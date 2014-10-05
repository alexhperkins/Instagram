require "rails_helper"

describe "pictures" do
  
  context "No pictures have been added" do 

  	it "should display a link to add a picture" do
  		
  		visit '/'

  		expect(page).to have_content('No pictures yet')
  		expect(page).to have_link('Add a picture')	
  	end

  	it "when a picture has been added" do
  		
			Picture.create(title: ' Eagle ', description:' My last project ')

			visit '/'

			expect(page).not_to have_content('No pictures yet')
			expect(page).to have_content('Eagle')
			expect(page).to have_content('My last project')
			expect(page).to have_link('Add a picture')	
  	end
  end

  xcontext "Adding a picture" do

  	it "can add a picture" do
	  	
	  	visit('/')

	  	click_link('Add a picture')

	  	expect(current_path).to eq('/pictures/new')
  		
  	end

  end

end