class IngredientController < ApplicationController
	def add
		if user_signed_in?
			if User.exists?(current_user.id)
				Ingredient.create(:title => params[:title], :description => params[:description])
				@success = true
			else
				@success = false
			end
		else
			@success = false
		end
	end
end
