class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :group_id
      t.float :price
      t.integer :duration_in_minutes
      t.date :date

      t.timestamps
    end
  end
end
