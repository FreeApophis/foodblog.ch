class Blog < ApplicationRecord
  include PublicActivity::Common
  include Commentable

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_paper_trail
  paginates_per 6

  searchable do
    text :title, :teaser, :text, :stored => true

    string :author do
      author.name
    end

    string :author do
      author.name
    end

    time :published_at
  end

  belongs_to :author, class_name: 'User'

  scope :published, -> { where("published_at < ?", DateTime.now)  }

  mount_uploader :header_image, BlogHeaderImageUploader

  def name
    title
  end

  def published?
    published_at < DateTime.now
  end
end
