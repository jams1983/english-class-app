class CreateGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_users do |t|
      t.integer :student_id
      t.integer :group_id

      t.timestamps
    end
  end
end
