class Quantity < ApplicationRecord
  validates :value, presence: true, numericality: { greater_than: 0 }
  validates :unit_type, presence: true
  validates :measurement_system, presence: true, inclusion: { in: %w[imperial metric] }

  IMPERIAL_UNITS = %w[cup oz]
  METRIC_UNITS = %w[ml l]
  ALL_UNITS = IMPERIAL_UNITS + METRIC_UNITS
  validates :unit_type, inclusion: {
    in: IMPERIAL_UNITS,
    if: -> { measurement_system == "imperial" }
  }
  validates :unit_type, inclusion: {
    in: METRIC_UNITS,
    if: -> { measurement_system == "metric" }
  }

  PRESETS = {
    imperial: [
      { value: 1, unit: "cup", display: "1 cup (8 oz)" },
      { value: 2, unit: "cup", display: "2 cups (16 oz)" }
    ],
    metric: [
      { value: 500, unit: "ml", display: "500 ml" }
    ]
  }

  def self.available_presets(system)
    PRESETS[system.to_sym] || []
  end

  def self.convert_to_alternate_system(value, from_unit)
    case from_unit
    when "cup"
      { value: (value * 236.588), unit: "ml" }  # 1 cup = 236.588 ml
    when "ml"
      { value: (value / 236.588), unit: "cup" } # Convert back to cups
    else
      { value: value, unit: from_unit }
    end
  end
end
