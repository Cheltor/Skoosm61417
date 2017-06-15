class AddCourseToSyllabus < ActiveRecord::Migration[5.0]
  def change
    add_column :syllabuses, :course_id, :integer
  end
end
