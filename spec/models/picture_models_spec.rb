require "rails_helper"

RSpec.describe Picture, :type => :model do

	it "Raise error if the title is empty" do

		pic = Picture.new(title: '')

		expect(pic).to have(1).error_on(:title)
		expect(pic).not_to be_valid
	end

end