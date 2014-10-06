class Comment < ActiveRecord::Base
	belongs_to :picture

	validates :content, length: {minimum:1}
	validates  :rating,   inclusion: (1..5)
end
