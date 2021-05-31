class SpecialsController < ApplicationController
  def index
    @special_cost = SpecialCost.new
    @special_costs = SpecialCost.where('extract(year from date) = ?', Time.now.year)
  end

  def create
    @special_costs = SpecialCost.where('extract(year from date) = ?', Time.now.year)
    @special_cost = SpecialCost.new(special_cost_params)
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
