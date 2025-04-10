class Survey < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    belongs_to :creator, class_name: 'User'
    has_many :categories, dependent: :destroy
    has_many :user_surveys
    has_many :respondents, through: :user_surveys, source: :user
end