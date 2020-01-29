class ProductTypesController < ApplicationController
  
  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.new(product_type_params)

    return redirect_to @product_type, 
      notice: 'Tipo de Produto registrado com sucesso' if @product_type.save
  end

  def show
    @product_type = ProductType.find(params[:id])
  end

  def index
    @product_types = ProductType.all
  end

  private

  def product_type_params
    params.require(:product_type).permit(:name, :description, :product_key)
  end
end