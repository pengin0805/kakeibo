class SpecialsController < ApplicationController
  def index
    @special_cost = SpecialCost.new
    # @special_costs_all = SpecialCost.all
    @special_costs = SpecialCost.where('extract(year from date) = ?', Time.now.year)
    @annual = Annual.new
    @annual1 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 1)
    @annual2 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 2)
    @annual3 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 3)
    @annual4 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 4)
    @annual5 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 5)
    @annual6 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 6)
    @annual7 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 7)
    @annual8 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 8)
    @annual9 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 9)
    @annual10 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 10)
    @annual11 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 11)
    @annual12 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 12)
    @ratio = @special_costs.joins(:specate).group("specates.name").sum(:price).sort_by { |_, v| v }.reverse.to_h
    @ratio.each do |k,v| 
      ratio = (v * 100).to_f / @special_costs.sum(:price)
      @ratio[k] = ratio.round(1)
    end
  end

  def create
    @special_cost = SpecialCost.new(special_cost_params)
    @special_costs = SpecialCost.where('extract(year from date) = ?', Time.now.year)
    @annual = Annual.new
    @annual1 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 1)
    @annual2 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 2)
    @annual3 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 3)
    @annual4 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 4)
    @annual5 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 5)
    @annual6 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 6)
    @annual7 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 7)
    @annual8 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 8)
    @annual9 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 9)
    @annual10 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 10)
    @annual11 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 11)
    @annual12 = Annual.where('extract(year from date) = ? AND extract(month from date) = ?', Time.now.year, 12)
    if @special_cost.save
      redirect_to specials_path
    else
      render :index
    end
  end

  def destroy
    if SpecialCost.find(params[:id]).destroy
      redirect_to action:"index"
    end
  end

  private

  def special_cost_params
    params.require(:special_cost).permit(:specate_id, :special_name, :price, :date)
  end

end
