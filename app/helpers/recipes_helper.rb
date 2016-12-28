module RecipesHelper
  def link_to_add_fields  name, f, association
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end

    link_to(icon('plus') + name, '#', class: "ui labeled icon green add_fields button", data: { id: id, fields: fields.gsub("\n", "")})
  end

  def portions_drop_down portions
    content_tag(:div, class: 'ui floating dropdown labeled search icon button') do
      icon('users') + content_tag(:span, class: 'text') do 
        t(:portions, scope: :recipes, count: portions)
      end + content_tag(:div, class: 'menu') do
        1.upto(12) do |p|
          concat(link_to(t(:portions, scope: :recipes, count: p), portions_recipe_path(@recipe, portions: p), class: :item))
        end
      end
    end
  end
end
