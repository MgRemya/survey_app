class UserSurveyResponse < ApplicationRecord
    belongs_to :user_survey
    belongs_to :question
    belongs_to :answer
    belongs_to :category
end
