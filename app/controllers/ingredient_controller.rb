class IngredientController < ApplicationController
	def add
		if user_signed_in?
			if User.exists?(current_user.id)
				i = Ingredient.create(:title => params[:title])
				@success = true
				@ing     = i
			else
				@success = false
			end
		else
			@success = false
		end
	end

	def list
		@ingredients=Ingredient.all
	end
end
