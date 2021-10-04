class User < ApplicationRecord
    has_attached_file :photo, styles: { large: '250x250', thumb: '60x60#' }
    has_attached_file :cover_image, styles: { large: '700x250'}

    validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
    validates :fullname, presence: true, length: {minimum: 5, maximum: 30}
    validates_attachment_content_type :photo, :cover_image,  
                        :content_type => ["image/jpg", "image/jpeg", "image/png"]

    has_many :opinions, foreign_key: 'author_id', dependent: :destroy
    has_many :followings, class_name: 'Following', foreign_key: 'follower_id'
    has_many :follows, through: :followings, source: :followed
    has_many :inverse_followings, class_name: 'Following', foreign_key: 'followed_id'
    has_many :followers, through: :inverse_followings, source: :follower
end
