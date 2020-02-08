class PlansController < ApplicationController
  before_action :set_view_name, only: %i[index]
  before_action :product_type_collection, only: :new
  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
    @product_types = ProductType.all
  end

  def create
    @plan = Plan.new(plan_params)
    return redirect_to @plan,
                       notice: t('.success') if @plan.save

    @product_types = ProductType.all
    render :new
  end

  private

  def product_type_collection
    @product_types = ProductType.all
  end

  def plan_params
    params.require(:plan).permit(:name, :description, :product_type_id,
                                 :details)
  end

  def set_view_name
    @view_name = 'Planos'
  end
end