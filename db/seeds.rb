# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Beverage categories with their subcategories
beverage_categories = [
  {
    name: 'Water-Based Beverages',
    subcategories: [
      'Plain Water',
      'Infused Water',
      'Coconut Water',
      'Electrolyte-Infused Water',
      'Oral Rehydration Solutions'
    ]
  },
  {
    name: 'Coffee-Based Beverages',
    subcategories: [
      'Black Coffee',
      'Espresso',
      'Americano',
      'Cold Brew',
      'Latte (Dairy-Based)',
      'Latte (Plant-Based)',
      'Cappuccino',
      'Mocha'
    ]
  },
  {
    name: 'Tea-Based Beverages',
    subcategories: [
      'Green Tea',
      'Black Tea',
      'White Tea',
      'Oolong Tea',
      'Herbal Tea',
      'Matcha',
      'Yerba Mate'
    ]
  },
  {
    name: 'Juice & Smoothies',
    subcategories: [
      'Fresh Fruit Juice',
      'Vegetable Juice',
      'Blended Smoothies (Fruit-Based)',
      'Blended Smoothies (Vegetable-Based)'
    ]
  },
  {
    name: 'Dairy-Based Beverages',
    subcategories: [
      'Whole Milk',
      'Low-Fat Milk',
      'Skim Milk',
      'Lactose-Free Milk',
      'Kefir',
      'Buttermilk'
    ]
  },
  {
    name: 'Plant-Based Milks',
    subcategories: [
      'Almond Milk (Unsweetened)',
      'Almond Milk (Sweetened)',
      'Oat Milk (Unsweetened)',
      'Oat Milk (Sweetened)',
      'Soy Milk',
      'Coconut Milk',
      'Rice Milk',
      'Hemp Milk'
    ]
  },
  {
    name: 'Fermented & Probiotic Beverages',
    subcategories: [
      'Kombucha',
      'Lassi',
      'Yakult',
      'Kvass'
    ]
  },
  {
    name: 'Carbonated & Artificially Sweetened Drinks',
    subcategories: [
      'Regular Soda',
      'Diet Soda',
      'Sparkling Water',
      'Energy Drinks',
      'Sports Drinks'
    ]
  },
  {
    name: 'Alcoholic Beverages',
    subcategories: [
      'Beer',
      'Wine',
      'Cider',
      'Cocktails',
      'Liquor'
    ]
  }
]

# Create beverages with their categories
beverage_categories.each do |category|
  beverage_category = BeverageCategory.find_or_create_by!(name: category[:name])

  category[:subcategories].each do |subcategory|
    Beverage.find_or_create_by!(
      name: subcategory,
      beverage_category: beverage_category
    )
  end
end

puts "Beverage seed data created successfully!"

# Symptoms
symptoms = [
  "Bloating",
  "Discomfort",
  "Nausea",
  "Acid Reflux / Heartburn",
  "Burping / Excess Gas",
  "Diarrhea / Loose Stools",
  "Constipation",
  "Cramping / Abdominal Pain",
  "Urgency to Poop",
  "Mucus in Stool",
  "Fatty / Oily Stools (Steatorrhea)",
  "Undigested Food in Stool",
  "Feeling Full / Heavy Stomach",
  "Dizziness / Lightheadedness",
  "Headache",
  "Dry Mouth / Sticky Saliva"
]

symptoms.each do |symptom_name|
  Symptom.find_or_create_by!(name: symptom_name)
end

puts "Symptom seed data created successfully!"

additives = [
  "Sugar",
  "Milk",
  "Creamer",
  "Lemon",
  "Lime",
  "Honey",
  "Artificial Sweeteners",
  "Protein Powder",
  "Electrolyte Powder"
]

additives.each do |additive_name|
  Additive.find_or_create_by!(name: additive_name)
end

puts "Additive seed data created successfully!"
