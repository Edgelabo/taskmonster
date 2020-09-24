class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :goal
      t.integer :ex, default: 0, null: false
      t.integer :lv, default: 0, null: false
      t.integer :user_id
      t.integer :monster_id
      t.timestamps
    end
  end
end
