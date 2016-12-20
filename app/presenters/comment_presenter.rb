class CommentPresenter < AbstractPresenter
  def comment_view
    h.content_tag(:div, class: 'comment') do
      h.link_to(m.user, class: 'avatar') do
        # TODO
      end + h.content_tag(:div, class: 'content') do
        h.link_to(m.user.email, m.user) +
        h.content_tag(:div, class: 'metadata') do
          m.created_at
        end + h.content_tag(:div, class: 'text') do
          m.comment
        end
      end
    end
  end
end
