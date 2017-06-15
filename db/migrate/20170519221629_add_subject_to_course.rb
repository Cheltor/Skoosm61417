class AddSubjectToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :subject_id, :integer
  end
end
