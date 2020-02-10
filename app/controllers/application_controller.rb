class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def set_view_name
    @view_name = 'Periodicidade'
  end
end
