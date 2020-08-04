class AddAdminColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_index :users, :email, unique: true
    add_index :users, :name
  end
end
