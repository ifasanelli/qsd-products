class PlansController < ApplicationController
  before_action :set_view_name, only: %i[index edit]
  before_action :dependencies, only: %i[create index edit]
  before_action :find_plan, only: %i[edit update]
  before_action :load_product_types, only: %i[index create edit]

  def index
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    return redirect_to plans_path, notice: t('.success') if @plan.available!
  rescue ActiveRecord::RecordInvalid
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
  end

  def update
    return redirect_to plans_path, notice: t('.success')\
                       if @plan.update(plan_params)

    load_product_types
    render :edit
  end

  private

  def dependencies
    @plans = Plan.all
  end

  def find_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :description, :product_type_id,
                                 :details, :status)
  end

  def load_product_types
    @product_types = ProductType.all
  end

  def set_view_name
    @view_name = Plan.model_name.human
  end
end
