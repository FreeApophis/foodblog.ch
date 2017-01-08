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
      end + h.content_tag(:div, class: 'content') do
        h.content_tag(:div, class: 'header') do
          m.name
        end
      end + h.content_tag(:div, class: 'extra content') do
        h.content_tag(:span, class: 'right floated') do
          # h.icon(:heart) + "0"
        end + h.content_tag(:span) do
          h.icon(:eye) + m.view_count.to_s
        end
      end
    end
  end

  def tags
    m.tag_list.map { |t| h.link_to(t, h.tag_recipes_path(t), class: 'ui tag label') }.join(' ').html_safe
  end

  def formatted_unit unit
    unit.abbrevation
  end

  def portions_drop_down portions
    h.content_tag(:div, class: 'ui floating dropdown labeled search icon button') do
      h.icon('users') + h.content_tag(:span, class: 'text') do 
        I18n.t(:portions, scope: :recipes, count: portions)
      end + h.content_tag(:div, class: 'menu') do
        1.upto(Setting.max_portions.to_i) do |p|
          h.concat(h.link_to(I18n.t(:portions, scope: :recipes, count: p), h.portions_recipe_path(m, portions: p), class: :item))
        end
      end
    end
  end

  def difficulty_dropdown f
    h.content_tag(:div, class: 'ui selection dropdown') do
      f.hidden_field(:difficulty) + h.icon(:dropdown) +
      h.content_tag(:div, I18n.t('select_difficulty', scope: :recipes), class: 'default text') +
      h.content_tag(:div, class: 'menu') do
        0.upto(4) do |difficulty|
          h.concat(h.content_tag(:div, difficulty_word(difficulty), class: 'item', 'data-value': difficulty.to_s))
        end
      end
    end
  end

  def tags_selection f
    h.content_tag(:div, id: 'tag_selection', class: 'ui multiple search selection dropdown') do
      f.hidden_field(:tag_list, value: m.tag_list.join(',')) + h.icon(:dropdown) +
      h.content_tag(:div, I18n.t('select_tags', scope: :recipes), class: 'default text') +
      h.content_tag(:div, class: 'menu') do
      end
    end
  end

  def difficulty_tag
    h.link_to difficulty_word(m.difficulty), '', class: "ui basic #{difficulty_color(m.difficulty)} label"   
  end

  def formatted_description
    h.simple_format(m.description)
  end

  def show_ingredients portions
    formatter = UnitNumberFormatter.new
    h.content_tag(:table, class: 'ui compact unstackable striped very basic table') do
      m.recipe_ingredients.each do |ri|
        h.concat(h.content_tag(:tr) do
          h.content_tag(:td, class: 'right aligned quantity') do
            if portions == m.portions
              formatter.format(ri.amount)
            else
              formatter.format(ri.amount * portions / m.portions)
            end
          end + h.content_tag(:td, class: 'unit') do
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
  def difficulty_word difficulty
    case difficulty
      when 0
        return I18n.t('easiest', scope: [:application, :difficulty])
      when 1
        return I18n.t('easy', scope: [:application, :difficulty])
      when 2
        return I18n.t('medium', scope: [:application, :difficulty])
      when 3
        return I18n.t('hard', scope: [:application, :difficulty])
      when 4
        return I18n.t('hardest', scope: [:application, :difficulty])
      else
        return I18n.t('unrated', scope: [:application, :difficulty])
    end
  end

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
end
