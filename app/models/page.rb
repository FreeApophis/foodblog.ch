class Page < ApplicationRecord
  has_paper_trail
  acts_as_nested_set left_column: :left, right_column: :right

  extend FriendlyId
  friendly_id :name, use: :slugged
end
