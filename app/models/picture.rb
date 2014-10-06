class Picture < ActiveRecord::Base
	has_many  :comments,    dependent: :destroy
	validates :title,       length: {minimum:1}
	validates :description, length: {minimum:1}
end
