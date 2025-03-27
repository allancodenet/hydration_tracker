class CreateAdditives < ActiveRecord::Migration[8.0]
  def change
    create_table :additives do |t|
      t.string :name

      t.timestamps
    end
  end
end
