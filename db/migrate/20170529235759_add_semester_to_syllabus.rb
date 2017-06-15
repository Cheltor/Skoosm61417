class AddSemesterToSyllabus < ActiveRecord::Migration[5.0]
  def change
    add_column :syllabuses, :semester_id, :integer
  end
end
