require "rails_helper"

describe "Comment" do	

	def fill_in_review(content,rating)
		visit '/pictures'
		click_link 'Comment'
		fill_in 'Content', with: content
		select  rating,        from: 'Rating'
    click_button 'Leave comment'
	end

	before(:each) do
		Picture.create(title: 'Eagle', description: 'My new project')
	end

	it "Any user can leave a Comment in the picture" do
		
		fill_in_review('Lovely bird',5)

    expect(page).to have_content('Lovely bird')
    expect(page).to have_content('☻☻☻☻☻')
    expect(current_path).to eq('/pictures')
  end


  it "The user will see a happy_face_rating" do
  	fill_in_review('Lovely bird',5)
  	fill_in_review('That is a bird?',1)

  	expect(page).to have_content('Average: ☻☻☻☺☺')
  end

end