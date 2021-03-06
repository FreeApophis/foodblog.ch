class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include Pundit

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index
#  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception, prepend: true

  def set_locale
    if current_user && current_user.locale
      I18n.locale =  current_user.locale.locale || I18n.default_locale
    else
      I18n.locale = I18n.default_locale
    end
  end

  def user_not_authorized exception
    flash[:error] = "You are not authorized to perform this action." + "#{exception.policy.class.to_s.underscore}.#{exception.query}"
    redirect_to(request.referrer || root_path)
  end

  def viewed model
    model.increment :view_count, 1
    model.save
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
