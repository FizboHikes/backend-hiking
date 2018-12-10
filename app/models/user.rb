class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
          :registerable,
          :validatable,
          :jwt_authenticatable,
          jwt_revocation_strategy: self

  has_one :profile
  has_many :hikes
  has_many :user_friends, dependent: :destroy
  has_many :friends, through: :user_friends
  has_many :follows, foreign_key: :friend_id, class_name: 'User'
  has_many :followers, through: :follows
end
