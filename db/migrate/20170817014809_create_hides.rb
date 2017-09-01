class CreateHides < ActiveRecord::Migration[5.0]
  def change
    create_table :hides do |t|

      t.timestamps
    end
  end
end
