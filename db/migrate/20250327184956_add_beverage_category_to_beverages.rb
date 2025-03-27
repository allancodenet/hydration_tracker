class AddBeverageCategoryToBeverages < ActiveRecord::Migration[8.0]
  def change
    add_reference :beverages, :beverage_category, null: false, foreign_key: true
  end
end
