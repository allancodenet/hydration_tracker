module Tracking
  class BeverageLogsController < ApplicationController
    before_action :authenticate_user!
    def new
      @beverage_log = BeverageLog.new
    end

    def create
      quantity = Quantity.create!(value: params[:tracking_beverage_log][:quantity][:value], unit_type: params[:tracking_beverage_log][:quantity][:unit_type], measurement_system: params[:tracking_beverage_log][:quantity][:measurement_system])
      temperature = Temperature.create!(degrees: params[:tracking_beverage_log][:temperature][:degrees], scale: params[:tracking_beverage_log][:temperature][:scale])
      @beverage_log = BeverageLog.new(beverage_log_params)
      if @beverage_log.valid?
        session[:beverage_log] = {
          beverage_id: @beverage_log.beverage_id,
          consumed_at: @beverage_log.consumed_at,
          additive_id: @beverage_log.additive_id,
          quantity: quantity.id,
          temperature: temperature.id
        }
        redirect_to new_tracking_symptom_log_path
      else
        render :new
      end
    end

    private

    def beverage_log_params
      params.require(:tracking_beverage_log).permit(:beverage_id, :consumed_at, :additive_id, quantity_attributes: [ :value, :unit_type, :measurement_system ], temperature_attributes: [ :degrees, :scale ])
    end
  end
end
