class PricesController < ApplicationController
  before_action :plans_collection, :periodicities_collection,
                only: %i[new create edit]
  def new
    @price = Price.new
  end

  def create
    @price = Price.new(price_params)
    @price.save
    redirect_to prices_path, notice: t('.success')
  end

  def show
    @price = Price.find(params[:id])
  end

  def index
    @prices = Price.all
  end

  def edit
    @price = Price.find(params[:id])
  end

  def update
    @price = Price.find(params[:id])
    msg = t('.success')
    return redirect_to prices_path, notice: msg if @price.update(price_params)

    @plans = Plan.all
    @periodicities = Periodicity.all
    render :edit
  end

  private

  def price_params
    params.require(:price).permit(:plan_price, :plan_id, :periodicity_id)
  end

  def plans_collection
    @plans = Plan.all
  end

  def periodicities_collection
    @periodicities = Periodicity.all
  end
end
