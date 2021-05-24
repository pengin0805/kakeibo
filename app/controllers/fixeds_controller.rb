class FixedsController < ApplicationController
  def index
    @fixed_cost = FixedCost.new
    @fixed_costs = FixedCost.where('extract(year from month) = ? AND extract(month from month) = ?', Time.now.year, Time.now.month)
    @variable_cost = VariableCost.new
    @variable_costs = VariableCost.where('extract(year from start_time) = ? AND extract(month from start_time) = ?', Time.now.year, Time.now.month)
  end
  
  def create
    @fixed_costs = FixedCost.where('extract(year from month) = ? AND extract(month from month) = ?', Time.now.year, Time.now.month)
    @variable_costs = VariableCost.where('extract(year from start_time) = ? AND extract(month from start_time) = ?', Time.now.year, Time.now.month)
    @fixed_cost = FixedCost.new(fixed_cost_params)
    @variable_cost = VariableCost.new
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
