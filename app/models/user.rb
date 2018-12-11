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
     UserFriend.new({friend: friend, user: self}).save
  end

end
