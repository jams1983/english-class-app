class CreatePriceDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :price_details do |t|
      t.integer :teacher_id
      t.integer :students_amount
      t.float :price

      t.timestamps
    end
  end
end
