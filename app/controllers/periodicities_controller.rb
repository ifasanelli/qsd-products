class PeriodicitiesController < ApplicationController
  before_action :set_view_name, only: %i[index edit]
  before_action :dependencies, only: %i[create index edit]

  def index
    @periodicities = Periodicity.all
    @periodicity = Periodicity.new
  end

  def create
    @periodicity = Periodicity.new(periodicity_params)
    if @periodicity.save
      redirect_to periodicities_path
    else
      render 'index'
    end
  end

  def edit
    @periodicity = Periodicity.find(params[:id])
  end

  def update
    @periodicity = Periodicity.find(params[:id])

    if @periodicity.update(periodicity_params)
      redirect_to periodicities_path
    else
      render 'edit'
    end
  end

  private

  def dependencies
    @periodicities = Periodicity.all
  end

  def periodicity_params
    params.require(:periodicity).permit(:name, :period)
  end
end
