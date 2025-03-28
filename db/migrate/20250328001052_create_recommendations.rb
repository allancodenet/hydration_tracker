class CreateRecommendations < ActiveRecord::Migration[8.0]
  def change
    create_table :recommendations do |t|
      t.text :content
      t.references :tracker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
