class CreateTrainingGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :training_groups do |t|
      t.references :course, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
