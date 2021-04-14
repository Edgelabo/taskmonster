class AddNameProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :admin_flg, :boolean
  end
end
