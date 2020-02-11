class PlansController < ApplicationController
  before_action :set_view_name, only: %i[index edit show]
  before_action :product_type_collection, only: %i[new create edit update]

  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    return redirect_to @plan, notice: t('.success') if @plan.save

    render :new
  end

  def edit
    @plan = Plan.find_by(params[:id])
  end

  def update
    @plan = Plan.find_by(params[:id])
    if @plan.update(plan_params)
      redirect_to @plan, notice: 'editado com sucesso'
    else
      render :edit
    end
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
