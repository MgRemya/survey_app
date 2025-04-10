class Category < ApplicationRecord
    belongs_to :survey
    has_many :questions, dependent: :destroy
    validates :name, presence: true
    validates :survey, presence: true
end
