class RecipeController < ApplicationController
	skip_before_filter :verify_authenticity_token

	#
	# description : Add a recipe
	# paramateres : user_id, title, description
	#
	def add
		if user_signed_in?
			if User.exists?(current_user.id)
				User.find(current_user.id).recipes.create(:title => params[:title], :description => params[:description])
				@success = true
			else
				@success = false
			end
		else
			@success = false
		end
	end
end
