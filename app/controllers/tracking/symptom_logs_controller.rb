module Tracking
  class SymptomLogsController < ApplicationController
    before_action :authenticate_user!
    def new
      @symptom_log = SymptomLog.new
    end

    def create
      @symptom_log = SymptomLog.new(symptom_log_params)
      if @symptom_log.valid?
        binding.break
        beverage_params = session[:beverage_log].dup
        quantity = Quantity.find(beverage_params.delete("quantity"))
        temperature = Temperature.find(beverage_params.delete("temperature"))
        all_params = symptom_log_params.merge(beverage_params).merge(
          quantity: quantity,
          temperature: temperature
        )
        tracker = current_user.trackers.create!(all_params)
        session.delete(:beverage_log)
        redirect_to tracker_path(tracker), notice: "Tracker created successfully"
      else
        render :new
      end
    end

    private

    def symptom_log_params
      params.require(:tracking_symptom_log).permit(:symptom_id, :symptom_severity, :symptom_timing)
    end
  end
end
