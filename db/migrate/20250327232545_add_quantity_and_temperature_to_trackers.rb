class AddQuantityAndTemperatureToTrackers < ActiveRecord::Migration[8.0]
  def change
    add_reference :trackers, :quantity, null: false, foreign_key: true
    add_reference :trackers, :temperature, null: false, foreign_key: true
  end
end
