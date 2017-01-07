class AbstractPresenter < SimpleDelegator
  def initialize(model, view)
    @model = model
    @view = view

    super(@model)
  end

  def h
    @view
  end

  def m
    @model
  end

  def validation_errors
    if m.errors.any?
      h.content_tag(:div, id: 'error_explanation') do
        h.content_tag(:h2, I18n.t('validation_error', scope: :application)) +
        h.content_tag(:ul) do
         recipe.errors.full_messages.each do |message|
           h.concat(h.content_tag(:li, message))
          end 
        end
      end
    else
      ''.html_safe
    end
  end
end
