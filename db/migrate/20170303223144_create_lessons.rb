class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :group_id
      t.integer :duration
      t.date :date

      t.timestamps
    end
  end
end
