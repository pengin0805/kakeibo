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
    @variable_ratio = @variable_costs.joins(:varicate).group("varicates.name").sum(:price).sort_by { |_, v| v }.reverse.to_h
    @variable_ratio.each do |k,v| 
      ratio = (v * 100).to_f / @variable_costs.sum(:price)
      @variable_ratio[k] = ratio.round(1)
    end
    @fixed_ratio = @fixed_costs.joins(:fixecate).group("fixecates.name").sum(:price).sort_by { |_, v| v }.reverse.to_h
    @fixed_ratio.each do |k,v| 
      ratio = (v * 100).to_f / @fixed_costs.sum(:price)
      @fixed_ratio[k] = ratio.round(1)
    end
    @fixed_name_ratio = @fixed_costs.joins(:fixecate_name).group("fixecate_names.name").sum(:price).sort_by { |_, v| v }.reverse.to_h
    @fixed_name_ratio.each do |k,v| 
      ratio = (v * 100).to_f / @fixed_costs.sum(:price)
      @fixed_name_ratio[k] = ratio.round(1)
    end



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

  def search
    if params["sample(1i)"] && params["sample(2i)"] && params["sample(3i)"]
    
      @search_day = Date.new(params["sample(1i)"].to_i, params["sample(2i)"].to_i, params["sample(3i)"].to_i)
      beginning_of_week = @search_day.beginning_of_week(:monday)
      @week1_sum = VariableCost.where(start_time:beginning_of_week...beginning_of_week+7).sum(:price)
      @week2_sum = VariableCost.where(start_time:beginning_of_week+7...beginning_of_week+14).sum(:price)
      @week3_sum = VariableCost.where(start_time:beginning_of_week+14...beginning_of_week+21).sum(:price)
      @week4_sum = VariableCost.where(start_time:beginning_of_week+21...beginning_of_week+28).sum(:price)
      @week5_sum = VariableCost.where(start_time:beginning_of_week+28...beginning_of_week+35).sum(:price)
      @week6_sum = VariableCost.where(start_time:beginning_of_week+35...beginning_of_week+42).sum(:price)
      @month_sum = VariableCost.where(start_time:@search_day...@search_day.next_month.beginning_of_month).sum(:price)

      @search_costs = VariableCost.where('extract(year from start_time) = ? AND extract(month from start_time) = ?', @search_day.year, @search_day.month).order(start_time: "ASC")
      @search_ratio = @search_costs.joins(:varicate).group("varicates.name").sum(:price).sort_by { |_, v| v }.reverse.to_h
      @search_ratio.each do |k,v| 
        ratio = (v * 100).to_f / @search_costs.sum(:price)
        @search_ratio[k] = ratio.round(1)
      end
    end
  end

  private

  def fixed_cost_params
    params.require(:fixed_cost).permit(:fixecate_id, :fixecate_name_id, :price, :month)
  end


end
