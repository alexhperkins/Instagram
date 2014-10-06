class Comment < ActiveRecord::Base
	belongs_to :restaurant

	validates :content, length: {minimum:1}
end
