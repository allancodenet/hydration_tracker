class AddAdditiveToTrackers < ActiveRecord::Migration[8.0]
  def change
    add_reference :trackers, :additive, null: true, foreign_key: true
  end
end
