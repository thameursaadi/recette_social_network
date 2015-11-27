class ProfilController < ApplicationController
	def get
		@user = User.find(params[:id])
	end
end
