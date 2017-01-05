class BlogPresenter < AbstractPresenter
  def date_ribbon
    h.content_tag :div, class: 'ribbon' do
      h.content_tag :span do
        h.content_tag(:em, class: 'post-date') do
          m.published_at.day.to_s
        end + h.content_tag(:strong, class: 'post-author') do
          m.published_at.strftime("%b")
        end
      end
    end 
  end 
 
  def teaser
    h.content_tag :p do
      m.teaser
    end
  end

  def title_link
    h.link_to m.title, m
  end

  def view_index
    h.link_to m do
      h.content_tag :span do
        h.icon('large eye') + m.view_count.to_s
      end
    end
  end

  def comment_index
    h.link_to h.blog_path(m, anchor: "comments") do
      h.content_tag :span do
        h.icon('large comment') + m.comments_count.to_s
      end
    end
  end

  def author_index
    h.link_to m do
      h.content_tag :span do
        h.icon('large user') + m.author.name
      end
    end
  end

  def read_more
    h.link_to m do
      h.content_tag :span do
        h.icon('large plus') + h.t(:read_more, scope: :blogs)
      end
    end
  end

  def formatted_teaser
    h.content_tag :em do
      m.teaser
    end
  end

  def formatted_text
    h.simple_format(m.text)
  end
end
