json.array!(@recipebyuser) do |recipe|
	json.(recipe , :id, :title, :description)
	json.email recipe.user.email
	json.userid recipe.user.id
	json.ingredients recipe.ingredients do |ingredient|
		json.id ingredient.id
		json.title ingredient.title
	end

	json.pictures recipe.pictures do |picture|
		json.id picture.id
		json.title picture.title
		json.url picture.url
	end
end