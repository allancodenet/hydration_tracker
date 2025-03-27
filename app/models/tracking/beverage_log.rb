module Tracking
  class BeverageLog
    include ActiveModel::Model

    attr_accessor :beverage_id, :consumed_at

    validates :beverage_id, :consumed_at, presence: true
  end
end
