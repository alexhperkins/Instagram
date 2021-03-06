require "rails_helper"

describe "pictures" do

	def create_test_picture
		Picture.create(title: ' Eagle ', description:' My last project ')
	end
  
  context "No pictures have been added" do 

  	it "should display a link to add a picture" do
  		
  		visit '/'

  		expect(page).to have_content('No pictures yet')
  		expect(page).to have_link('Add a picture')	
  	end

  	it "when a picture has been added" do
  		create_test_picture

			visit '/'

			expect(page).to have_content('Instagram')
			expect(page).not_to have_content('No pictures yet')
			expect(page).to have_content('Eagle')
			expect(page).to have_content('My last project')
			expect(page).to have_link('Add a picture')	
  	end
  end

  context "Adding a picture" do

  	it "can add a picture" do
	  	
	  	visit('/')

	  	click_link('Add a picture')

	  	expect(current_path).to eq('/pictures/new')

	  	fill_in 'Title',       with: 'Eagle'
	  	fill_in 'Description', with: 'My last project'

	  	click_button 'Create Picture'

	  	expect(current_path).to eq('/pictures')
  	end
	end

	 context "Submitting wrong information" do

	 	before(:each) do
	 		create_test_picture
	 	end

	 	it "The title field can not be empty" do
  		
  		visit '/pictures'

  		click_link('Add a picture')
      fill_in 'Title', with: ''
      click_button 'Create Picture'

      expect(page).not_to have_css 'h1', text: ' '
      expect(page).to have_content('error')
  	end
	 end



	context "Updating a picture" do

		it "The user can update a picture" do
			create_test_picture

			visit '/'

			click_link('Update')

			fill_in 'Title',       with: 'Parrot'
			fill_in 'Description', with: 'Just a project' 

			click_button 'Update Picture'

			expect(page).to have_content('Parrot')
			expect(page).to have_content('Just a project')
			expect(current_path).to eq('/pictures')
		end
	end

	context 'Deleting a picture' do
		
		it "The user can delete a picture" do
			create_test_picture

			visit('/')

			click_link 'Delete'

			expect(page).to have_content('Eagle has been deleted')

			expect(current_path).to eq('/pictures')
			
		end

	context 'Showing a picture' do
		
		it "The user can see the picture in full page" do
			create_test_picture

			visit '/'

			click_link 'Show'

			expect(page).to have_content('Eagle')
			expect(current_path).to match(/pictures\/\d/)
		end

		it "The user can return to the main page" do
			create_test_picture

			visit '/'

			click_link 'Show'

			expect(current_path).to match(/pictures\/\d/)

			expect(page).to have_link('Home')

			click_link 'Home'

			expect(current_path).to eq('/pictures')
		end
	end


	end

end




















