class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys do |t|
      t.string :title
      t.text :description
      t.references :creator, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
