class CreateUserSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :user_surveys do |t|
      t.references :user, foreign_key: true
      t.references :survey, foreign_key: true
      t.timestamps
    end
  end
end
