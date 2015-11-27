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

	def delete
		User.find(current_user.id).recipes.find(params[:id]).destroy()
	end

	def update
		User.find(current_user.id).recipes.find(params[:id]).update(:title => params[:title],:description => params[:description])
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

	def deleteIngredient
		if user_signed_in?
			if User.exists?(current_user.id)
				User.find(current_user.id).recipes.find(params[:id]).ingredients.delete(Ingredient.find(params[:ingredient_id]))
				@success = true
			else
				@success = false
			end
		else
			@success = false
		end
	end

	def  recipelist
		@recipeslist=Recipe.all
		@current_user = current_user
	end

	def recipeid
		@current_user = current_user
		if Recipe.exists?(:id => params[:id])
			@verif =true 
			@recipebyid =Recipe.find(params[:id])
		else
			@verif = false
		end
	end
	def recipeuser
		@current_user = current_user
		if User.exists?(params[:id])
			@recipebyuser = User.find(params[:id]).recipes
			@test = true
		else
			@test = false
		end
	end
end
