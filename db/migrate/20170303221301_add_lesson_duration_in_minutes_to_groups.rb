class AddLessonDurationInMinutesToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :lesson_duration_in_minutes, :integer
  end
end
