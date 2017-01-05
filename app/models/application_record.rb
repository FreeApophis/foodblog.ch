class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def created_message
    I18n.t('application.created_message', model: self.class.model_name.human)
  end

  def updated_message
    I18n.t('application.updated_message', model: self.class.model_name.human)
  end

  def destroyed_message
    I18n.t('application.destroyed_message', model: self.class.model_name.human)
  end
end
