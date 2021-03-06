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
  has_many :user_friends, dependent: :destroy, foreign_key: "user_id"
  has_many :friends, through: :user_friends

  def get_friend_hikes
    total_hikes = []
    friends.each do |friend|
      friend.hikes.each do |hike|
        total_hikes << hike

      end
    end
    total_hikes
  end

  def add_friend(friend)
     UserFriend.create({friend: friend, user: self})
  end


end
