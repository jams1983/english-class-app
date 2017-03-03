class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :subject_id
      t.float :lesson_price, default: 0

      t.timestamps
    end
  end
end
