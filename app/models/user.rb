class User < ApplicationRecord
  enum role: { user:  0, admin: 100 }

  extend FriendlyId
  friendly_id :name, use: :slugged

  paginates_per 12

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :recipes, foreign_key: :author_id
  has_many :blogs, foreign_key: :author_id
end
