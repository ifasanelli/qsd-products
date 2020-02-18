class PricesController < ApplicationController
  before_action :set_view_name, only: %i[index edit]
  before_action :dependencies, only: %i[create index edit]
  before_action :find_price, only: %i[edit update]
  before_action :load_plans_and_periodicities, only: %i[index create edit]

  def index
    @price = Price.new
  end

  def create
    @price = Price.new(price_params)
    return redirect_to prices_path, notice: t('.success') if @price.save

    render :index
  end

  def edit
  end

  def update
    return redirect_to prices_path, notice: t('.success') \
                       if @price.update(price_params)

    load_plans_and_periodicities
    render :edit
  end

  private

  def dependencies
    @prices = Price.all
  end

  def find_price
    @price = Price.find(params[:id])
  end

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
