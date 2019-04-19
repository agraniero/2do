class ChangeUsersUidToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :uid, :integer
  end
end
