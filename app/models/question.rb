class Question < ApplicationRecord
    belongs_to :category
    validates :content, presence: true
    validates :category, presence: true
end
