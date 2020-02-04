class Api::V1::ProductTypesController < Api::V1::ApiController
  def index
    render json: ProductType.all
  end
end
