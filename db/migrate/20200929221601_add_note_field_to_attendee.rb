class AddNoteFieldToAttendee < ActiveRecord::Migration[5.0]
  def change
    add_column :attendees, :note, :string
  end
end
