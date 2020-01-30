class ProductTypesController < ApplicationController
  before_action :find_product_type, only: %i[show edit update]
  
  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.new(product_type_params)
    return redirect_to @product_type, 
      notice: t('.success') if @product_type.save
    render :new
  end

  def show; end

  def index
    @product_types = ProductType.all
  end

  def edit; end

  def update  
    return redirect_to @product_type, 
      notice: t('.success') if @product_type.update(product_type_params)
    render :edit
  end

  private

  def find_product_type
    @product_type = ProductType.find(params[:id])
  end

  def product_type_params
    params.require(:product_type).permit(:name, :description, :product_key)
  end
end