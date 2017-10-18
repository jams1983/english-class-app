class AddNoteFieldToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :note, :string
  end
end
