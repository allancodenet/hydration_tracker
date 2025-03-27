module Tracking
  class BeverageLog
    include ActiveModel::Model

    attr_accessor :beverage_id, :quantity, :temperature, :consumption_at

    validates :beverage_id, :quantity, :temperature, :consumption_at, presence: true
  end
end
