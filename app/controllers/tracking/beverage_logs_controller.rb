module Tracking
  class BeverageLogsController < ApplicationController
    def new
      @beverage_log = BeverageLog.new
    end

    def create
      @beverage_log = BeverageLog.new(beverage_log_params)
      if @beverage_log.valid?
        session[:beverage_log] = @beverage_log.attributes
        redirect_to new_tracking_symptom_log_path
      else
        render :new
      end
    end

    private

    def beverage_log_params
      params.require(:tracking_beverage_log).permit(:beverage_id, :quantity, :temperature, :consumption_at)
    end
  end
end
