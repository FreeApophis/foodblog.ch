class UserPresenter < AbstractPresenter
  def avatar
    h.link_to m, class: 'ui basic orange image label' do
      h.image_tag(m.avatar_url(:thumb)) + m.name
    end
  end

  def as_card
    h.link_to(m, class: 'ui fluid card') do
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
end
