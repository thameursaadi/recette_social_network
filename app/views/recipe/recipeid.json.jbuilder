json.(@recipebyid , :id, :title, :description)
json.email @recipebyid.user.email
json.userid @recipebyid.user.id

if @current_user != nil
	if @recipebyid.user.id != @current_user.id
		json.isme "none"
	end
else
	json.isme "none"
end

json.rates @recipebyid.rates do |rate|
	json.id rate.id
	json.value rate.value
	json.userid rate.user.id
end
json.ingredients @recipebyid.ingredients do |ingredient|
	json.id ingredient.id
	json.title ingredient.title
end

json.pictures @recipebyid.pictures do |picture|
	json.id picture.id
	json.title picture.title
	json.url picture.url
end