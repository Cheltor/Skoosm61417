class AddCommentIdToHide < ActiveRecord::Migration[5.0]
  def change
    add_column :hides, :comment_id, :integer
    add_index :hides, :comment_id
  end
end
