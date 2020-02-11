class PlansController < ApplicationController
  before_action :set_view_name, only: %i[index edit]
  before_action :dependencies, only: %i[create index edit update]
  before_action :product_type_collection, only: %i[index edit]

  def index
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    return redirect_to plans_path, notice: t('.success') if @plan.available!
  rescue ActiveRecord::RecordInvalid
    product_type_collection
    render :index
  end

  def unavailable
    find_plan.unavailable!
    redirect_back(fallback_location: plans_path)
  end

  def available
    find_plan.available!
    redirect_back(fallback_location: plans_path)
  end

  def edit
    @plan = Plan.find_by(params[:id])
  end

  def update
    @plan = Plan.find_by(params[:id])
    return redirect_to plans_path, notice: t('.success')\
                       if @plan.update(plan_params)

    product_type_collection
    render :edit
  end

  private

  def find_plan
    @plan = Plan.find(params[:id])
  end

  def dependencies
    @plans = Plan.all
  end

  def product_type_collection
    @product_types = ProductType.all
  end

  def plan_params
    params.require(:plan).permit(:name, :description, :product_type_id,
                                 :details, :status)
  end

  def set_view_name
    @view_name = Plan.model_name.human
  end
end
