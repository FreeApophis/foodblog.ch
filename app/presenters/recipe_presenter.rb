class RecipePresenter < AbstractPresenter
  def formatted_unit unit
    unit.abbrevation
  end

  def show_ingredients
    h.content_tag(:table, class: 'ui compact striped very basic table') do
      m.recipe_ingredients.each do |ri|
        h.concat(h.content_tag(:tr) do
          h.content_tag(:td, class: 'right aligned') do
            ri.amount.to_s
          end + h.content_tag(:td) do
            formatted_unit(ri.unit)
          end + h.content_tag(:td) do
            ri.ingredient.name
          end
        end)
      end
    end
  end

  def show_preparation_steps
    h.content_tag(:ol, class: 'preparation') do
      m.preparation_steps.each do |ps|
        h.concat(h.content_tag(:li) do
         ps.text
        end)
      end
    end
  end
end
