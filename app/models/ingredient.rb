class Ingredient < ApplicationRecord
  include PublicActivity::Common

  extend FriendlyId
  friendly_id :name, use: :slugged

end
