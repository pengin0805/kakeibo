class CostsController < ApplicationController
  def index
    @fixed_cost = FixedCost.new
  end
  
  def create
    @fixed_cost = FixedCost.new(fixed_cost_params)
    @fixed_cost.save
  end

  private

  def fixed_cost_params
    params.permit(:fixed_category_id, :fixed_id, :price, :month)
  end
end
