json.extract! recipe, :name, :slug, :description, :difficulty
json.author recipe.author.name

json.tags(recipe.tags) do |tag|
  json.tag tag.name
end

json.images(recipe.images) do |image|
  json.url image.file.url(:slide)
  json.name image.name
end

json.url recipe_url(recipe, format: :json)
