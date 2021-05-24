class VariablesController < ApplicationController
  def create
    @variable_costs = VariableCost.all
    @fixed_costs = FixedCost.all
    @variable_cost = VariableCost.new(variable_cost_params)
    @fixed_cost = FixedCost.new
    if @variable_cost.save
      redirect_to root_path
    else
      render template: "fixeds/index"
    end
  end

  private

  def variable_cost_params
    params.require(:variable_cost).permit(:variable_category_id, :variable_name, :price, :start_time)
  end

end
