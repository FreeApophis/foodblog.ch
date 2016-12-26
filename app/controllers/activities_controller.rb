class ActivitiesController < ApplicationController
  def index
    @activities = policy_scope(PublicActivity::Activity).order(created_at: :desc)    
  end
end
