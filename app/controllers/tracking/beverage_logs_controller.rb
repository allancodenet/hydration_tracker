module Tracking
  class BeverageLogsController < ApplicationController
    before_action :authenticate_user!
    def new
      @beverage_log = BeverageLog.new
    end

    def create
      @beverage_log = BeverageLog.new(beverage_log_params)
      if @beverage_log.valid?
        session[:beverage_log] = {
          beverage_id: @beverage_log.beverage_id,
          consumed_at: @beverage_log.consumed_at
          # quantity: @beverage_log.quantity,
          # temperature: @beverage_log.temperature
        }
        redirect_to new_tracking_symptom_log_path
      else
        render :new
      end
    end

    private

    def beverage_log_params
      params.require(:tracking_beverage_log).permit(:beverage_id, :consumed_at, additives_attributes: [ :name ], quantity_attributes: [ :value, :unit_type, :measurement_system ], temperature_attributes: [ :degrees, :scale ])
    end
  end
end
