class PricesController < ApplicationController
  before_action :load_plans_and_periodicities, only: %i[index new create]
  before_action :set_view_name, only: %i[index show]

  def index
    @prices = Price.all
  end

  def show
    @price = Price.find(params[:id])
  end

  def new
    @price = Price.new
  end

  def create
    @price = Price.new(price_params)
    return redirect_to @price, notice: t('.success') if @price.save

    render :new
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
    @view_name = 'Preços'
  end
end
