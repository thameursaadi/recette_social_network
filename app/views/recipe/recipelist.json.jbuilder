json.array!(@recipeslist) do |recipe|
	json.extract! recipe , :id, :title, :description

	json.array!(@ingredientslist) do |ingredient|
		json.extract! ingredient , :id, :title, :description
	end

	json.array!(@pictureslist) do |picture|
		json.extract! picture , :id, :title
	end
end