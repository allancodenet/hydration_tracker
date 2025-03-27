class CreateTrackers < ActiveRecord::Migration[8.0]
  def change
    create_table :trackers do |t|
      t.datetime :consumed_at
      t.boolean :symptom_occurence
      t.string :symptom_severity
      t.string :symptom_timing
      t.references :beverage, null: false, foreign_key: true
      t.references :symptom, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
