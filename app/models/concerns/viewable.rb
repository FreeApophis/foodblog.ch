module Viewable
  extend ActiveSupport::Concern

  included do
    has_one :view, as: :viewable, dependent: :destroy
  end
end
