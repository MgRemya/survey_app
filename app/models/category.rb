class Category < ApplicationRecord
    belongs_to :survey
    has_many :questions, dependent: :destroy
end
