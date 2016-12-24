module ApplicationHelper
  def present(model, presenter_class=nil)
    presenter_class = presenter_class || "#{model.class}Presenter".constantize
    presenter = presenter_class.new(model, self)
    if block_given?
      yield(presenter) 
    else
      presenter
    end
  end

  def time_ago time
    time_ago_in_words(time) + ' ' + I18n.t(:ago, scope: :application)
  end

  def context_title title
    sitename = 'foodblog.ch'
    title_tag = "#{sitename} - #{title}"
    content_for :title do
      title_tag
    end
    title
  end

  def context_menu text, link, icon_type = nil
    link_to link, class: 'item' do 
      if icon_type
        text.html_safe + icon(icon_type)
      else
        text.html_safe
      end
    end
  end

  def context_action text, link, icon_type = nil
    content_for :actions do
      context_menu text, link, icon_type
    end
  end

  def active_menu_link path, text, icon=false
    parsed = Rails.application.routes.recognize_path(path)
    classes = ['item']
    classes << 'active' if controller_name == parsed[:controller]
    link_to  path, class: classes.join(' ') do
      (icon ? content_tag(:i, '', class: "#{icon.to_s} icon") : ''.html_safe) +
      text
    end
  end

  def delete_modal model
  end

  def icon icon_class
    classes = [ icon_class, 'icon' ]
    return content_tag(:i, '', class: classes.join(' '))
  end
end
