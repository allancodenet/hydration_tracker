class CreateQuantities < ActiveRecord::Migration[8.0]
  def change
    create_table :quantities do |t|
      t.decimal :quantity
      t.string :unit

      t.timestamps
    end
  end
end
