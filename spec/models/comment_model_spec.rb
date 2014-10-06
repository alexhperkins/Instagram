require "rails_helper"

RSpec.describe Comment, type: :model do

	it "raise an error if the content field is empty" do
		
		comment = Comment.new(content: '')

		expect(comment).to have(1).error_on(:content)
		expect(comment).not_to be_valid
	end

	it "is not valid with a rating less than 1" do
    comment = Comment.new(rating: '-1')

    expect(comment).to have(1).error_on(:rating)
	end

	it "is not valid with a rating more than 5" do
    comment = Comment.new(rating: '6')

    expect(comment).to have(1).error_on(:rating)
	end

	it "is only valid with a rating between 1..5" do
		comment = Comment.new(rating:4, content: 'Best picture ever')
		expect(comment).to be_valid
	end
end