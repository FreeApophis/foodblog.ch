class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include Pundit
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index
#  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  def user_not_authorized exception
    flash[:error] = "You are not authorized to perform this action." + "#{exception.policy.class.to_s.underscore}.#{exception.query}"
    redirect_to(request.referrer || root_path)
  end

  def viewed model
    model.increment :view_count, 1
    model.save
  end
end
