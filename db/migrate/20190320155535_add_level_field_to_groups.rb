class AddLevelFieldToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :level, :string
  end
end
