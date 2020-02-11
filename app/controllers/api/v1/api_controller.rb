class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_precondition_failed
  rescue_from ArgumentErro, with: :render_precondition_failed
end
