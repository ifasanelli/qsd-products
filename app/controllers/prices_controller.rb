class PricesController < ApplicationController
  before_action :load_plans_and_periodicities, only: %i[index create edit]
  before_action :set_view_name, only: %i[index]

  def index
    @prices = Price.all
    @price = Price.new
  end

  def edit
    @price = Price.find(params[:id])
    @prices = Price.all
  end

  def update
    @price = Price.find(params[:id])
    msg = t('.success')
    return redirect_to prices_path, notice: msg if @price.update(price_params)

    load_plans_and_periodicities
    render :edit
  end

  def create
    @price = Price.new(price_params)
    return redirect_to prices_path, notice: t('.success') if @price.save

    @prices = Price.all
    render :index
  end

  private

  def price_params
    params.require(:price).permit(:plan_price, :plan_id, :periodicity_id)
  end

  def load_plans_and_periodicities
    @plans = Plan.all
    @periodicities = Periodicity.all
  end

  def set_view_name
    @view_name = Price.model_name.human
  end
end
