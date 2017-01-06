json.extract! recipe, :id, :name, :description

recipe.recipe_ingredients.each do |ingredient|
  json.extract! ingredient, :ingredient_id
end

json.url recipe_url(recipe, format: :json)
