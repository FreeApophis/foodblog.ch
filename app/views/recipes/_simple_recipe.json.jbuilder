json.extract! recipe, :name, :description, :preparation_time, :cooking_time, :difficulty, :portions
json.author recipe.author.name

json.tags do 
  recipe.tags.each do |tag|
    json.tag tag.name
  end
end

json.images do 
  recipe.images.each do |image|
    json.url image.file.url(:slide)
    json.name image.name
  end
end

json.url recipe_url(recipe, format: :json)
