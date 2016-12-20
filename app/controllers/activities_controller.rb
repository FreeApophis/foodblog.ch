class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order(created_at: :desc)#.where(owner_id: current_user.friend_ids, owner_type: "User")
    skip_policy_scope
  end
end
