class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         acts_as_voter 
         
         has_many :hosted_tours, class_name:"Tour", foreign_key:"host_id"
         has_many :reviews
         has_many :blogs
         has_many :posts
         has_many :comments
         has_many :joinedtours
         has_many :wishlists
         has_many :interested_tours, :through => :joinedtours, :source => :tour
         has_many :wishlisted_tours, :through => :wishlists, :source => :tour
         has_one_attached :profile
         has_one :registration

         ## relationship section

         has_many :active_relationships, class_name:"Relationship", foreign_key:"follower_id", dependent: :destroy
         has_many :passive_relationships, class_name:"Relationship", foreign_key:"followed_id", dependent: :destroy

         has_many :followers, through: :passive_relationships, source: :follower
         has_many :following, through: :active_relationships, source: :followed

         ###
         before_save :email_down
         VALID_REGEX_VALUE = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :profile, presence: true
    validates :last_name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
         format: { with: VALID_REGEX_VALUE }, uniqueness: { case_sensitive: false }

         ### tour section
         def join tour
         	interested_tours << tour
         	if wishlisted?(tour)
         		remove_from_wishlist(tour)
         	end
         end
         def feed
            following_ids_subselect = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
            Post.where(" user_id IN (#{following_ids_subselect}) OR user_id = :user_id", user_id: id)
        end

         def joined?(tour)
         	interested_tours.include?(tour)
         end


         #### wishlist section
         def add_to_wishlist tour
         	wishlisted_tours << tour
         end

         def wishlisted?(tour)
         	wishlisted_tours.include?(tour)
         end

         def remove_from_wishlist(tour)
         	wishlisted_tours.delete(tour)
         end

         #### relationship section

         def follow(user)
             following << user
         end

         def unfollow(user)
             following.delete(user)
         end

         def followed?(user)
             following.include?(user)
         end

private

def email_down
    self.email = email.downcase
end



end
