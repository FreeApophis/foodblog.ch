class CommentPresenter < AbstractPresenter
  def comment_view
    h.content_tag(:div, class: 'comment') do
      h.link_to(m.user, class: 'avatar') do
        h.image_tag(m.user ? m.user.avatar_url(:thumb) : 'guest-avatar.png');
      end + h.content_tag(:div, class: 'content') do
        (m.user ? h.link_to(m.user.name, m.user, class: 'author') : 'Unknown Guest'.html_safe) +
        h.content_tag(:div, class: 'metadata') do
          m.created_at
        end + h.content_tag(:div, class: 'text') do
          m.comment
        end
      end
    end
  end
end
