class Api::V1::PricesController < Api::V1::ApiController
  def index
    @prices = Price.where('plan_id LIKE ?', "%#{params[:id]}%")
    return render json: @prices\
           if Plan.where('status LIKE ?', "%0%").find_by(params[:id])

    render json: '', status: :not_found
  end
end
