class ProductTypesController < ApplicationController
  before_action :set_view_name, only: %i[index edit]
  before_action :dependencies, only: %i[create index edit]
  before_action :find_product_type, only: %i[edit update]

  def index
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.new(product_type_params)
    @product_type.product_key.upcase!
    return redirect_to product_types_path,
                       notice: t('.success') if @product_type.save

    render :index
  end

  def edit
  end

  def update
    @product_type.product_key.upcase!
    return redirect_to product_types_path, notice: t('.success')\
                       if @product_type.update(product_type_params)

    render :edit
  end

  private

  def dependencies
    @product_types = ProductType.all
  end

  def find_product_type
    @product_type = ProductType.find(params[:id])
  end

  def product_type_params
    params.require(:product_type).permit(:name, :description, :product_key)
  end

  def set_view_name
    @view_name = ProductType.model_name.human
  end
end
