class AddMeasurementSystemToQuantities < ActiveRecord::Migration[8.0]
  def change
    add_column :quantities, :measurement_system, :string
    rename_column :quantities, :quantity, :value
    rename_column :quantities, :unit, :unit_type
  end
end
