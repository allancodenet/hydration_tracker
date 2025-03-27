class CreateTemperatures < ActiveRecord::Migration[8.0]
  def change
    create_table :temperatures do |t|
      t.decimal :degrees, precision: 5, scale: 2
      t.string :scale
      t.string :description

      t.timestamps
    end
  end
end
