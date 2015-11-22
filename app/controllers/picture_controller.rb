class PictureController < ApplicationController
	#
	#description : add pictures for a recipe
	#
	def add
		if user_signed_in?
			if User.exists?(current_user.id)
				User.find(current_user.id).recipes.find(params[:id]).pictures.create(:title => params[:title], :description => params[:description], :url => params[:url])
				@success = true
			else
				@success = false
			end
		else
			@success = false
		end
	end

	def delete
		if user_signed_in?
			if User.exists?(current_user.id)
				User.find(current_user.id).recipes.find(params[:recipe_id]).pictures.find(params[:picture_id]).delete()
				@success = true
			else
				@success = false
			end
		else
			@success = false
		end
	end
	
end
