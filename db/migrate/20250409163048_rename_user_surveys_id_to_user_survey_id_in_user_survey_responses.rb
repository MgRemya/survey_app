class RenameUserSurveysIdToUserSurveyIdInUserSurveyResponses < ActiveRecord::Migration[7.1]
  def change
    rename_column :user_survey_responses, :user_surveys_id, :user_survey_id
  end
end
