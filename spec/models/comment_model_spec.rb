require "rails_helper"

RSpec.describe Comment, type: :model do

	it "raise an error if the content field is empty" do
		
		comment = Comment.new(content: '')

		expect(comment).to have(1).error_on(:content)
		expect(comment).not_to be_valid
	end


end