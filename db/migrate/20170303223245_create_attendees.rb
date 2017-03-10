class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.integer :student_id
      t.integer :lesson_id
      t.integer :attendance_option_id

      t.timestamps
    end
  end
end
