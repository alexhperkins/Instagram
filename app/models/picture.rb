class Picture < ActiveRecord::Base
	has_many  :comments,    dependent: :destroy
	validates :title,       length: {minimum:1}
	validates :description, length: {minimum:1}

	def average_rating
		return 'N/A' if comments.none?

		comments.inject(0){ |memo, comment| memo + comment.rating } / comments.length

	end

end
