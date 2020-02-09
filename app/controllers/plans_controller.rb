class PlansController < ApplicationController
  before_action :set_view_name, only: %i[index]
  before_action :dependencies, only: %i[create index]
  before_action :product_type_collection, only: %i[index]
  def index
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    return redirect_to plans_path, notice: t('.success') if @plan.save

    product_type_collection
    render :new
  end

  private

  def dependencies
    @plans = Plan.all
  end

  def product_type_collection
    @product_types = ProductType.all
  end

  def plan_params
    params.require(:plan).permit(:name, :description, :product_type_id,
                                 :details)
  end

  def set_view_name
    @view_name = Plan.model_name.human
  end
end
