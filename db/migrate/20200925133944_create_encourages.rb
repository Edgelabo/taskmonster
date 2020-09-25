class CreateEncourages < ActiveRecord::Migration[6.0]
  def change
    create_table :encourages do |t|
      t.text :comment
      t.timestamps
    end
  end
end
