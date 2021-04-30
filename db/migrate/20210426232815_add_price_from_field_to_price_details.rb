class AddPriceFromFieldToPriceDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :price_details, :price_from, :date
  end
end
