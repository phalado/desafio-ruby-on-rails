class AddAdminColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_index :users, :email, unique: true
    add_index :users, :name
    remove_column :users, :password, :string
    remove_column :users, :password_confirmation, :string
    add_column :users, :password_digest, :string
  end
end
