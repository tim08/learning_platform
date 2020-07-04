class CreateJoinTableTrainingGroupStudent < ActiveRecord::Migration[5.2]
  def change
    create_join_table :training_groups, :students do |t|
      t.index [:training_group_id, :student_id], name: "index_training_group_student"
      t.index [:student_id, :training_group_id], name: "index_student_training_group"
    end
  end
end
