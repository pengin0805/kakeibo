class VariablesController < ApplicationController
  def create
    @variable_costs = VariableCost.where('extract(year from start_time) = ? AND extract(month from start_time) = ?', Time.now.year, Time.now.month).order(start_time: "ASC")
    @fixed_costs = FixedCost.where('extract(year from month) = ? AND extract(month from month) = ?', Time.now.year, Time.now.month)
    
    @variable_cost = VariableCost.new(variable_cost_params)
    @fixed_cost = FixedCost.new
    if @variable_cost.save
      redirect_to root_path
    else
      render template: "fixeds/index"
    end
  end

  def destroy
    if VariableCost.find(params[:id]).destroy
      redirect_to root_path
    end
  end

  private

  def variable_cost_params
    params.require(:variable_cost).permit(:variable_category_id, :variable_name, :price, :start_time)
  end

end
