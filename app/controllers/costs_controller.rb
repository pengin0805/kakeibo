class CostsController < ApplicationController
  def index
    @fixed_cost = FixedCost.new
  end
  
  def create
    @fixed_cost = FixedCost.new(fixed_cost_params)
    if @fixed_cost.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def fixed_cost_params
    params.require(:fixed_cost).permit(:fixed_category_id, :fixed_id, :price, :month)
  end
end
