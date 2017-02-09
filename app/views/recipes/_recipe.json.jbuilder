json.extract! recipe, :name, :description, :preparation_time, :cooking_time, :difficulty, :portions
json.author recipe.author.name

json.ingredients do 
  recipe.recipe_ingredients.each do |ri|
    json.amount ri.amount
    json.u ri.unit.abbrevation
    json.unit ri.unit.name
    json.ingredient ri.ingredient.name
  end
end

json.preparation_steps do 
  recipe.preparation_steps.each do |ps|
    json.step ps.text
  end
end

json.tags do 
  recipe.tags.each do |tag|
    json.tag tag.name
  end
end

json.hints do 
  recipe.hints.each do |hint|
    json.hint hint.text
  end
end

json.images do 
  recipe.images.each do |image|
    json.url image.file.url(:slide)
    json.name image.name
  end
end

json.url recipe_url(recipe, format: :json)
