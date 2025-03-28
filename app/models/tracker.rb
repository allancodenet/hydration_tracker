class Tracker < ApplicationRecord
  belongs_to :beverage
  belongs_to :symptom
  belongs_to :user
  belongs_to :additive
  belongs_to :quantity
  belongs_to :temperature
  has_many :recommendations, dependent: :destroy

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


  after_create_commit :generate_and_save_recommendations


  private

  def generate_and_save_recommendations
    # Clear existing recommendations
    recommendations.destroy_all

    # Generate new recommendations
    recommendations_list = []

    # Check for acid reflux with hot beverages
    if symptom.name.downcase.include?("acid reflux") && temperature.name.downcase == "hot"
      recommendations_list << "Hot drinks can trigger acid reflux. Try drinking at a warm or room temperature instead."
    end

    # Check for bloating with carbonated drinks
    if symptom.name.downcase.include?("bloating") &&
       beverage.beverage_category&.name&.downcase&.include?("carbonated")
      recommendations_list << "Carbonated beverages may contribute to bloating. Try limiting intake."
    end

    # Check for dehydration symptoms with sugary drinks
    dehydration_symptoms = [ "dry mouth", "headache" ]
    if dehydration_symptoms.any? { |s| symptom.name.downcase.include?(s) } &&
       beverage.beverage_category&.name&.downcase&.include?("sugary")
      recommendations_list << "High sugar intake can lead to dehydration. Consider switching to water or herbal tea."
    end

    # Save each recommendation
    recommendations_list.each do |content|
      recommendations.create(content: content)
    end
  end
end
