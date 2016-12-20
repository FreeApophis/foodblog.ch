class Comment < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :user
end
