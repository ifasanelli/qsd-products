class PeriodicitiesController < ApplicationController
  before_action :set_view_name, only: %i[index edit edit]
  before_action :dependencies, only: %i[create index edit]
  before_action :find_periodicity, only: %i[edit update]

  def index
    @periodicity = Periodicity.new
  end

  def create
    @periodicity = Periodicity.new(periodicity_params)
    return redirect_to periodicities_path,
                       notice: t('.success') if @periodicity.save

    render :index
  end

  def edit
  end

  def update
    return redirect_to periodicities_path, notice: t('.success')\
                       if @periodicity.update(periodicity_params)

    render :edit
  end

  private

  def dependencies
    @periodicities = Periodicity.all
  end

  def find_periodicity
    @periodicity = Periodicity.find(params[:id])
  end

  def periodicity_params
    params.require(:periodicity).permit(:name, :period)
  end

  def set_view_name
    @view_name = Periodicity.model_name.human
  end
end
