class AddFieldsToAttendees < ActiveRecord::Migration[5.0]
  def change
    add_column :attendees, :student_perc, :float, default: 0
    add_column :attendees, :koombea_perc, :float, default: 0
  end
end
