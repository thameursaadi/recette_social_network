class ProfilController < ApplicationController
	def get
		@user = User.find(params[:id])
	end

	def follow
		User.find(current_user.id).active_relationships.create(:followed_id => params[:id])
	end

	def nombreFollowers
		@n = User.find(params[:id]).following.count
	end

	def followed
		@followed = User.find(current_user).active_relationships.all
		@recipes = []
		@followed.each do |f|
			@recipes.concat f.followed.recipes.all
		end 
	end
end
