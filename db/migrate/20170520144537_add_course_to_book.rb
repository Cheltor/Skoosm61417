class AddCourseToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :course_id, :integer
  end
end
