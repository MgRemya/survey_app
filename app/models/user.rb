class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    has_many :surveys, foreign_key: :creator_id
    has_many :user_surveys
    has_many :attempted_surveys, through: :user_surveys, source: :survey
end
