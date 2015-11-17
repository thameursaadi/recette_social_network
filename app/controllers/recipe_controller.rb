class RecipeController < ApplicationController
	skip_before_filter :verify_authenticity_token

	#
	# description : Add a recipe
	# paramateres : title, description
	#
	def add
		@id = nil
		if user_signed_in?
			if User.exists?(current_user.id)
				u = User.find(current_user.id).recipes.create(:title => params[:title], :description => params[:description])
				@success = true
				@id      = u.id
			else
				@success = false
			end
		else
			@success = false
		end
	end

	#
	# description : Add an Ingredient to a recipe
	# paramateres : id : recipe_id, ingredient_id
	#
	def addIngredient
		if user_signed_in?
			if User.exists?(current_user.id)
				User.find(current_user.id).recipes.find(params[:id]).ingredients.push(Ingredient.find(params[:ingredient_id]))
				@success = true
			else
				@success = false
			end
		else
			@success = false
		end
	end
end
