class RateController < ApplicationController
	def add
		if Rate.exists?(:recipe_id => params[:id],:user_id => current_user.id)
			Rate.where(:recipe_id => params[:id],:user_id => current_user.id).first.update(:value => params[:value])
		else
			rate = User.find(current_user.id).rates.create(:value => params[:value])
			Recipe.find(params[:id]).rates.push(rate)
		end
	end
end
