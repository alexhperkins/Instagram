require "rails_helper"

describe "Comment" do	

	def fill_in_review(content,rating)
		click_link 'Comment this'
		fill_in 'Content', with: content
		select  rating,        from: 'Rating'
    click_button 'Leave comment'
	end

	before(:each) do
		Picture.create(title: 'Eagle', description: 'My new project')
	end

	it "Any user can leave a Comment in the picture" do
		
		visit '/pictures'

		fill_in_review('Lovely bird',5)

    expect(page).to have_content('Lovely bird')
    expect(page).to have_content('5')
    expect(current_path).to eq('/pictures')
  end


end