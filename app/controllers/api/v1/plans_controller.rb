class Api::V1::PlansController < Api::V1::ApiController
  def index
    render json: Plan.all
  end
end
