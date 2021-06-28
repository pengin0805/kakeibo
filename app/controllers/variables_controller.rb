class VariablesController < ApplicationController
  def create
    @variable_costs = VariableCost.where('extract(year from start_time) = ? AND extract(month from start_time) = ?', Time.now.year, Time.now.month).order(start_time: "ASC")
    @fixed_costs = FixedCost.where('extract(year from month) = ? AND extract(month from month) = ?', Time.now.year, Time.now.month)
    @variable_cost = VariableCost.new(variable_cost_params)
    @fixed_cost = FixedCost.new
    today = Date.today
    beginning_of_week = Date.new(today.year, today.month, today.beginning_of_month.day).beginning_of_week(:monday)
    @week1_sum = VariableCost.where(start_time:beginning_of_week...beginning_of_week+7).sum(:price)
    @week2_sum = VariableCost.where(start_time:beginning_of_week+7...beginning_of_week+14).sum(:price)
    @week3_sum = VariableCost.where(start_time:beginning_of_week+14...beginning_of_week+21).sum(:price)
    @week4_sum = VariableCost.where(start_time:beginning_of_week+21...beginning_of_week+28).sum(:price)
    @week5_sum = VariableCost.where(start_time:beginning_of_week+28...beginning_of_week+35).sum(:price)
    @week6_sum = VariableCost.where(start_time:beginning_of_week+35...beginning_of_week+42).sum(:price)
    @month_sum_variable = VariableCost.where(start_time:today.beginning_of_month...today.next_month.beginning_of_month).sum(:price)
    @month_sum_fixed = FixedCost.where(month:today.beginning_of_month...today.next_month.beginning_of_month).sum(:price)
    @month_sum_special = SpecialCost.where(date:today.beginning_of_month...today.next_month.beginning_of_month).sum(:price)
    @month_status = 50000 - @month_sum_variable
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
    params.require(:variable_cost).permit(:varicate_id, :variable_name, :price, :start_time, :card)
  end

end
