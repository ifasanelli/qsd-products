class PeriodicitiesController < ApplicationController
  before_action :set_view_name, only: %i[index edit]
  before_action :dependencies, only: %i[create index edit]

  def index
    @periodicity = Periodicity.new
  end

  def create
    @periodicity = Periodicity.new(periodicity_params)
    return redirect_to periodicities_path if @periodicity.save

    @errors = @periodicity.errors.full_messages
    redirect_to periodicities_path, flash: { error: @errors }
  end

  def edit
    @periodicity = Periodicity.find(params[:id])
  end

  def update
    periodicity = Periodicity.find(params[:id])
    return render :index if periodicity.update(periodicity_params)

    render :edit
  end

  private

  def dependencies
    @periodicities = Periodicity.all
  end

  def periodicity_params
    params.require(:periodicity).permit(:name, :period)
  end
end
