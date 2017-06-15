class CreateSyllabuses < ActiveRecord::Migration[5.0]
  def change
    create_table :syllabuses do |t|

      t.timestamps
    end
  end
end
