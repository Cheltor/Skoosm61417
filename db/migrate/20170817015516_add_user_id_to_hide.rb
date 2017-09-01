class AddUserIdToHide < ActiveRecord::Migration[5.0]
  def change
    add_column :hides, :user_id, :integer
    add_index :hides, :user_id
  end
end
