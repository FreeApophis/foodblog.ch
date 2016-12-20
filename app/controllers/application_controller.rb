class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include Pundit
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index

  protect_from_forgery with: :exception


  def viewed model
    model.increment :view_count, model.id
    model.save
  end
end
