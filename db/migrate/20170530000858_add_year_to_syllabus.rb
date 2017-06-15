class AddYearToSyllabus < ActiveRecord::Migration[5.0]
  def change
    add_column :syllabuses, :year_id, :integer
  end
end
