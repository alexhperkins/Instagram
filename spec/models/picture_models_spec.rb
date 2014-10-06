require "rails_helper"

RSpec.describe Picture, :type => :model do

	it "Raise error if the title is empty" do

		pic = Picture.new(title: '')

		expect(pic).to have(1).error_on(:title)
		expect(pic).not_to be_valid
	end


	it "Raise error if the description is empty" do

		pic = Picture.new(description: '')

		expect(pic).to have(1).error_on(:description)
		expect(pic).not_to be_valid
	end

	describe "#average_rating" do
	  
	  it "with no reviews" do
      pic = Picture.create(title:'Eagle',description:'My new project')
	  	expect(pic.average_rating).to eq('N/A')
	  end

	  it "with 1 review" do
	  	pic = Picture.create(title:'Eagle',description:'My new project')
	  	pic.comments.new(rating: 4)

	  	expect(pic.average_rating).to eq(4)
	  end

	  it "with 2 reviews" do
	  	pic = Picture.create(title:'Eagle',description:'My new project')
	  	pic.comments.new(rating: 5)
	  	pic.comments.new(rating: 3)

	  	expect(pic.average_rating).to eq(4)
	  end

	end

end