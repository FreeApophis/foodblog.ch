class Blog < ApplicationRecord
  include PublicActivity::Common
  include Commentable

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author, class_name: 'User'

  scope :published, -> { where("published_at < ?", DateTime.now)  }

  def published?
    published_at < DateTime.now
  end
end
