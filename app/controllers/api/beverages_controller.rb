module Api
  class BeveragesController < ApplicationController
    def index
      @beverages = Beverage.where(beverage_category_id: params[:beverage_category_id])
      render json: @beverages
    end
  end
end
