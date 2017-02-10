json.extract! recipe, :name, :description, :preparation_time, :cooking_time, :difficulty, :portions
json.author recipe.author.name

json.people(@people) do |person|
  json.name person.name
  json.age calculate_age(person.birthday)
end

json.ingredients(recipe.recipe_ingredients) do |ri|
  json.amount ri.amount
  json.u ri.unit.abbrevation
  json.unit ri.unit.name
  json.ingredient ri.ingredient.name
end

json.preparation_steps(recipe.preparation_steps) do |ps|
  json.step ps.text
end

json.tags(recipe.tags) do |tag|
  json.tag tag.name
end

json.hints(recipe.hints) do |hint|
  json.hint hint.text
end

json.images(recipe.images) do |image|
  json.url image.file.url(:slide)
  json.name image.name
end

json.url recipe_url(recipe, format: :json)
