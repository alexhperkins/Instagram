class Comment < ActiveRecord::Base
	belongs_to :picture
	has_many   :likes
	validates  :content, length: {minimum:1}
	validates  :rating,   inclusion: (1..5)
end
