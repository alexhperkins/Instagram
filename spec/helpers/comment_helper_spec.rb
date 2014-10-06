require "rails_helper"

describe CommentsHelper, type: :helper do

	context "#happy_face_rating" do

		it "shows N/A when there is no comments" do
			expect(helper.happy_face_rating('N/A')).to eq('N/A')
		end

		it "shows 5 happy faces for a rating of 5" do
			expect(helper.happy_face_rating(5)).to eq('☻☻☻☻☻')
		end

		it "shows 3 happy faces for a rating of 4" do
			expect(helper.happy_face_rating(3)).to eq('☻☻☻☺☺')
		end

		it "returns the nearest number for a float number" do
			expect(helper.happy_face_rating(4.6)).to eq('☻☻☻☻☻')
		end

		it "returns the nearest number for a float number" do
			expect(helper.happy_face_rating(3.2)).to eq('☻☻☻☺☺')
		end
	end
end