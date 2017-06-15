class AddUniversityToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :university_id, :integer
  end
end
