class Api::V1::PlansController < Api::V1::ApiController
  def index
    render json: Plan.all
  end

  def show
    return render json: @plan, status: :ok if (@plan = Plan.find(params[:id]))
  end

  private

  def render_not_found(exception)
    render json: exception.message, status: :not_found
  end
end
