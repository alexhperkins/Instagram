class PicturesController < ApplicationController

	def index
		@pictures = Picture.all
	end

	def new
		@picture = Picture.new
	end

	def create

		@picture = Picture.new(params[:picture].permit(:title,:description))

		if @picture.save

			redirect_to pictures_path
		else
			redirect_to new_picture_path
		end
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update

		@picture = Picture.find(params[:id])
		
		@picture.update(params[:picture].permit(:title,:description))
		redirect_to pictures_path
	end

	def destroy
		@picture = Picture.find(params[:id])

		@picture.destroy

		flash[:notice] = "#{@picture.title} has been deleted"

		redirect_to pictures_path
	end

	def show
		@picture = Picture.find(params[:id])
	end

end
