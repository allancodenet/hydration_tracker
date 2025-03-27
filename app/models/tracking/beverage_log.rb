module Tracking
  class BeverageLog
    include ActiveModel::Model

    attr_accessor :beverage_id, :consumed_at, :additive_id

    validates :beverage_id, :consumed_at, :additive_id, presence: true
  end
end
