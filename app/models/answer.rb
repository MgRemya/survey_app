class Answer < ApplicationRecord
    validates :content, presence: true
    validates :score, presence: true
end
