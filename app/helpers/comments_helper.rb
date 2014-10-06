module CommentsHelper

	def happy_face_rating(rating)
		return 'N/A' unless rating.respond_to?(:round)

		reminder = (5-rating.round )

		('☻' * rating.round) + ('☺' * reminder)
	end

end
