class Tracker < ApplicationRecord
  belongs_to :beverage
  belongs_to :symptom
  belongs_to :user
  belongs_to :additive
  belongs_to :quantity
  belongs_to :temperature

  accepts_nested_attributes_for :quantity, :temperature
  SYMPTOM_SEVERITY = [
    [ "Mild", "mild" ],
    [ "Moderate", "moderate" ],
    [ "Severe", "severe" ]
  ]

  SYMPTOM_TIMING = [
    [ "Immediate", "immediate" ],
    [ "Within 20-30 minutes", "within_20_30_minutes" ],
    [ "Within 2-5 hours", "within_2_5_hours" ],
    [ "5+ hours later", "within_5_hours" ]
  ]
end
