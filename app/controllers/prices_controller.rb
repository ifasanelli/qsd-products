class PricesController < ApplicationController
  before_action :load_plans_and_periodicities, only: %i[new create]

  def index
  end

  def show
    @price = Price.find(params[:id])
  end

  def new
    @price = Price.new
  end

  def create
    @price = Price.new(price_params)
    @price.save
    redirect_to @price, notice: t('.success')
  end

  private

  def price_params
    params.require(:price).permit(:plan_price, :plan_id, :periodicity_id)
  end

  def load_plans_and_periodicities
    @plans = Plan.all
    @periodicities = Periodicity.all
  end
end
