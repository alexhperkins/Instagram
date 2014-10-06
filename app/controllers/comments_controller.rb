class CommentsController < ApplicationController

	def new
		@picture = Picture.find(params[:picture_id])
		@comment = Comment.new
	end

	def create
		@picture = Picture.find(params[:picture_id])
    @picture.comments.create(params[:comment].permit(:content,:rating))
		
		redirect_to pictures_path
	end
end
