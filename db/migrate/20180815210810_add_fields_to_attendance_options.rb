class AddFieldsToAttendanceOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :attendance_options, :student_perc, :float
    add_column :attendance_options, :koombea_perc, :float
  end
end
