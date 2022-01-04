class User < ApplicationRecord
    has_secure_password
    has_many :kitchens
    has_many :items
    has_many :friendships, dependent: :destroy
    has_many :friendships_requests, lambda { |user| unscope(where: :user_id) .where("status = 'Pending'") .where('friendships.user_id = :user_id OR friendships.other_user_id = :user_id ', user_id: user.id) }, class_name: 'Friendship'
    has_many :friends, lambda { |user|unscope(where: :user_id).where("status = 'Active'") .where('friendships.user_id = :user_id OR friendships.other_user_id = :user_id ',user_id: user.id)},class_name: 'Friendship' 
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, through: :inverse_friendships, source: :user
    has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest
    has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest
    has_many :messages, through: :friendships
    has_many :shopping_lists
    has_many :food_logs
    has_many :recipes
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    def friendslist
        friends_array = friendships.map{|friendship| friendship.friend.name}
        friends_array + inverse_friendships.map{|friendship| friendship.user.name}
        friends_array.compact
      end
    
      #users who haven't accepted friend request
      def pending_friends
        friendships.map{|friendship| friendship.friend if !friendship.confirmed}.compact
      end
    
      #users who have requested to be friends
      def friend_requests
        inverse_friendships.map{|friendship| friendship.user if !friendship.confirmed}.compact
      end
    
      def confirm_friend(user)
        friendship = inverse_friendships.find{|friendship| friendship.user == user}
        friendship.confirmed = true
        friendship.save
      end

      def firstname
        user
      end
    
    
end
