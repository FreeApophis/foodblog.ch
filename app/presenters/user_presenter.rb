class UserPresenter < AbstractPresenter
  def avatar
    h.link_to m, class: "ui basic #{m.color} image label" do
      h.image_tag(m.avatar_url(:thumb)) + m.name
    end
  end

  def as_card
    h.link_to(m, class: "ui fluid #{m.color} card") do
      h.content_tag(:div, class: 'image') do
        h.image_tag m.avatar_url(:big)
      end + h.content_tag(:div, class: 'content') do
        h.content_tag(:div, class: 'header') do
          m.name
        end + h.content_tag(:div, class: 'meta') do
          I18n.t(:joined_in, scope: :users, year: m.created_at.year)
        end + h.content_tag(:div, m.description, class: :description)
      end + h.content_tag(:div, class: 'extra content') do
        h.icon('food') + I18n.t(:recipes_count, scope: :users, count: m.recipes.count)
      end
    end
  end

  def color_dropdown f
    h.content_tag(:div, class: 'ui selection dropdown') do
      f.hidden_field(:color) + h.icon(:dropdown) +
      h.content_tag(:div, I18n.t('select_color', scope: :users), class: 'default text') +
      h.content_tag(:div, class: 'menu') do
        User.colors.each do |color, id|
          h.concat(h.content_tag(:div, class: 'item', 'data-value': color) do
            h.content_tag(:div, '', class: "ui #{color} empty circular label") + I18n.t(color, scope: [:users, :colors])
          end)
        end
      end
    end
  end
end
