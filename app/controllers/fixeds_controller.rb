class FixedsController < ApplicationController
  def index
    @fixed_cost = FixedCost.new
    @fixed_costs = FixedCost.where('extract(year from month) = ? AND extract(month from month) = ?', Time.now.year, Time.now.month)
    @variable_cost = VariableCost.new
    @variable_costs_all = VariableCost.all
    @variable_costs = VariableCost.where('extract(year from start_time) = ? AND extract(month from start_time) = ?', Time.now.year, Time.now.month).order(start_time: "ASC")
    # 今月一週間のカラム取得後に合計金額算出
    today = Date.today
    beginning_of_week = Date.new(today.year, today.month, today.beginning_of_month.day).beginning_of_week(:monday)
    @week1_sum = VariableCost.where(start_time:beginning_of_week...beginning_of_week+7).sum(:price)
    @week2_sum = VariableCost.where(start_time:beginning_of_week+7...beginning_of_week+14).sum(:price)
    @week3_sum = VariableCost.where(start_time:beginning_of_week+14...beginning_of_week+21).sum(:price)
    @week4_sum = VariableCost.where(start_time:beginning_of_week+21...beginning_of_week+28).sum(:price)
    @week5_sum = VariableCost.where(start_time:beginning_of_week+28...beginning_of_week+35).sum(:price)
    @week6_sum = VariableCost.where(start_time:beginning_of_week+35...beginning_of_week+42).sum(:price)
    @month_sum = VariableCost.where(start_time:today.beginning_of_month...today.next_month.beginning_of_month).sum(:price)
    @last_month_sum = VariableCost.where(start_time:today.last_month.beginning_of_month...today.beginning_of_month).sum(:price)
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

  def destroy
    if FixedCost.find(params[:id]).destroy
      redirect_to root_path
    end
  end

  private

  def fixed_cost_params
    params.require(:fixed_cost).permit(:fixed_category_id, :fixed_id, :price, :month)
  end


end
