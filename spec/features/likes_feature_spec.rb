require "rails_helper"

describe "Liking a comment" do
  
  before do
    pic = Picture.create(title:'Eagle', description:'My new project')
    pic.comments.create(content:'That is not an eagle', rating:2)
  end

  it "The user can like a review updating the likes count", js: true do
  	
  	visit '/pictures'

  	click_link('Like')

  	expect(page).to have_content('0 likes')
	end

end