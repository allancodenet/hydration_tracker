class CreateBeverages < ActiveRecord::Migration[8.0]
  def change
    create_table :beverages do |t|
      t.string :name
      t.string :category
      t.string :subcategory
      t.decimal :calories_per_100ml

      t.timestamps
    end
  end
end
