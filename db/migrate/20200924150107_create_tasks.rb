class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task
      t.boolean :check, default: false
      t.integer :goal_id
      t.string :tag
      t.date :limit_date
      t.timestamps
    end
  end
end
