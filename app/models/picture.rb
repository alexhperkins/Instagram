class Picture < ActiveRecord::Base
	validates :title, length: {minimum:1}
end
