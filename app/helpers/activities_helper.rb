module ActivitiesHelper
  def render_feed_event(activity, icon_name, &block)  
    summary = capture(&block)  

    content_tag(:div, class: 'event') do
      content_tag(:div, class: 'label') do
        icon icon_name
      end + content_tag(:div, :class => 'content') do
        content_tag(:div, class: 'date') do
          time_ago(activity.created_at)
        end + content_tag(:div, class: 'summary') do
          summary
        end
      end
    end
  end
end
