class Api::V1::ProductTypesController < Api::V1::ApiController
  def index
    render json: ProductType.all
  end

  def show
    @plans = Plan.where('product_type_id LIKE ?', "%#{params[:id]}%")
    render json: @plans
  end
end
