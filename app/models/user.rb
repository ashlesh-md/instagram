class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :notifications
  has_many :followers, foreign_key: :follower_id, class_name: "Follow"
  has_many :following, foreign_key: :followed_id, class_name: "Follow"

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true, length: { minimum: 6 }

end
