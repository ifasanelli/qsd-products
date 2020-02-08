class Api::V1::PricesController < Api::V1::ApiController
  def index
    render json: Price.where('plan_id LIKE ?', "%#{params[:id]}%")
  end
end
