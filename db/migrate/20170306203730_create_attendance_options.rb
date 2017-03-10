class CreateAttendanceOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :attendance_options do |t|
      t.string :description
      t.boolean :bill

      t.timestamps
    end
  end
end
