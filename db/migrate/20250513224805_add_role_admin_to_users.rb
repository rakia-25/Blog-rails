class AddRoleAdminToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role_admin, :boolean, null: false, default: false
  end
end
