class AnnualsController < ApplicationController

  def create
    @annual = Annual.new(annual_params)
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
    @special_cost = SpecialCost.new
    @special_costs = SpecialCost.where('extract(year from date) = ?', Time.now.year)
    if @annual.save
      redirect_to specials_path
    else
      render "specials/index"
    end
  end

  private

  def annual_params
    params.require(:annual).permit(:specate_id, :special_name, :price, :date)
  end

end
