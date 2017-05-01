class Comment < ActiveRecord::Base
  include PublicActivity::Common

  has_paper_trail

  belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :user
end
