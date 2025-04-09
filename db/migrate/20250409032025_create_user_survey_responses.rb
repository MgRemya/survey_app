class CreateUserSurveyResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :user_survey_responses do |t|
      t.references :user_surveys, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :score
      t.timestamps
    end
  end
end
