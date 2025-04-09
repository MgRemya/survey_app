class User < ApplicationRecord
    has_secure_password
    has_many :surveys, foreign_key: :creator_id
    has_many :user_surveys
    has_many :attempted_surveys, through: :user_surveys, source: :survey
end
