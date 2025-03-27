class Tracker < ApplicationRecord
  belongs_to :beverage
  belongs_to :symptom
  belongs_to :user
end
