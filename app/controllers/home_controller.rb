class HomeController < ApplicationController
  before_action :set_view_name, only: %i[index]

  def index
  end

  private

  def set_view_name
    @view_name = 'Página Principal'
  end
end
