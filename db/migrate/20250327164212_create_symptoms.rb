class CreateSymptoms < ActiveRecord::Migration[8.0]
  def change
    create_table :symptoms do |t|
      t.string :name
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
