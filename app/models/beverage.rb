class Beverage < ApplicationRecord
  belongs_to :beverage_category, optional: true
end
