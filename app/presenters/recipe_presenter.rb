class RecipePresenter < AbstractPresenter
  def as_card
    h.link_to(m, class: 'ui fluid card') do
      h.content_tag(:div, class: 'content') do
        h.content_tag(:div, class: 'right floated meta') do
          h.time_ago_in_words m.created_at
        end + h.image_tag(m.author.avatar_url(:thumb), class: 'ui avatar image') + ' ' + m.author.name
      end + h.content_tag(:div, class: 'image') do
        if m.images.any?
          h.image_tag m.images.sample.file.url(:slide)
        else
          h.image_tag "/default.png"
        end
      end + h.content_tag(:div, class: 'extra content') do
        h.content_tag(:div, class: 'header') do
          m.name
        end
      end
    end
  end

  def formatted_unit unit
    unit.abbrevation
  end

  def difficulty_tag
    h.link_to difficulty_word(m.difficulty), '', class: "ui basic #{difficulty_color(m.difficulty)} label"   
  end

  def formatted_description
    h.simple_format(m.description)
  end

  def show_ingredients
    h.content_tag(:table, class: 'ui compact unstackable striped very basic table') do
      m.recipe_ingredients.each do |ri|
        h.concat(h.content_tag(:tr) do
          h.content_tag(:td, class: 'right aligned') do
            ri.amount.to_s
          end + h.content_tag(:td) do
            formatted_unit(ri.unit)
          end + h.content_tag(:td) do
            ri.ingredient ? ri.ingredient.name : "UNKNOWN INGREDIENT (ID:#{ri.ingredient_id})"
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
private
  def difficulty_color difficulty
    case difficulty
      when 0
        return 'green'
      when 1
        return 'olive'
      when 2
        return 'yellow'
      when 3
        return 'orange'
      when 4
        return 'red'
      else
        return ''
    end
  end

  def difficulty_word difficulty
    case difficulty
      when 0
        return 'easiest'
      when 1
        return 'easy'
      when 2
        return 'medium'
      when 3
        return 'hard'
      when 4
        return 'hardest'
      else
        return 'not rated'
    end
  end
end
