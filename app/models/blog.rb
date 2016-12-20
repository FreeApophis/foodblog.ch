class Blog < ApplicationRecord
  include PublicActivity::Common
  include Commentable

  belongs_to :author, class_name: 'User'

  def published?
    published_at < DateTime.now
  end
end
