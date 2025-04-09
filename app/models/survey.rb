class Survey < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :categories, dependent: :destroy
    has_many :user_surveys
    has_many :respondents, through: :user_surveys, source: :user
end
