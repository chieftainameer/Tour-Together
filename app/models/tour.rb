class Tour < ApplicationRecord
	belongs_to :host, class_name:"User", foreign_key:"host_id"
	has_many :reviews
	has_many_attached :images
	has_many :joinedtours
	has_many :wishlists
	has_many :interested_users, :through => :joinedtours, :source => :user
	has_many :wishlisted_by_users, :through => :wishlists, :source => :user
	acts_as_votable

	validates :title, presence: true, length: {maximum: 70}
	validates :description, presence: true, length: {maximum: 500}
	validates :budget, presence: true
	validates :reg_date_ends, presence: true
	validates :places, presence: true
	validates :services, presence: true
end
