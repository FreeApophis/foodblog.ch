class User < ApplicationRecord
  enum role: { user:  0, admin: 100 }
  enum color: { black: 0, grey: 1, red: 2, orange: 3, yellow: 4, olive: 5, green: 6, teal: 7, blue: 8, violet: 9, purple: 10, pink: 11, brown: 12 }

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_paper_trail
  paginates_per 12

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :name, length: { minimum: 3 }

  validates :email, presence: true
  validates :email, format: { with: Devise.email_regexp }

  belongs_to :locale
  has_many :recipes, foreign_key: :author_id
  has_many :blogs, foreign_key: :author_id
  has_many :comments
end
