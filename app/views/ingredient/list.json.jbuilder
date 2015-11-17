json.array!(@ingredients) do |ingredient|
	json.extract! ingredient , :id, :title, :description 
end