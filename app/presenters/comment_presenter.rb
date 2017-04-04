class CommentPresenter < AbstractPresenter
  def comment_view
    comment_policy = h.policy(@model)
    h.content_tag(:div, class: 'comment') do
      h.link_to(m.user, class: 'avatar') do
        h.image_tag(m.user ? m.user.avatar_url(:thumb) : 'guest-avatar.png');
      end + h.content_tag(:div, class: 'content') do
        (m.user ? h.link_to(m.user.name, m.user, class: 'author') : h.content_tag(:span, 'Unknown Guest', class: 'author')) +
        h.content_tag(:div, class: 'metadata') do
          m.created_at
        end + h.content_tag(:div, class: 'text') do
          m.comment
        end + h.content_tag(:div, class: 'actions') do
          if comment_policy.update?
            h.link_to(I18n.t(:edit, scope: [:application, :actions]), [:edit, @model])
          else
            ''.html_safe
          end +
          if comment_policy.destroy?
            h.link_to(I18n.t(:destroy, scope: [:application, :actions]), h.delete_modal_anchor(@model), class: 'open_modal', 'data-modal-id':  h.delete_modal_anchor(@model)) +
            h.delete_modal(@model, :comment)
          else
            ''.html_safe
          end
        end
      end
    end
  end
end
