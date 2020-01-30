class PeriodicitiesController < ApplicationController
  def index
    @periodicity = Periodicity.new
    @periodicities = Periodicity.all
    if @periodicities.empty?
      flash[:alert] = 'a'
      flash[:notice] = 'b'
    end
  end

  def create
    @periodicity = Periodicity.new(periodicity_params)
    if @periodicity.save
      redirect_to periodicities_path
    else
      @periodicities = Periodicity.all
      redirect_to periodicities_path
    end
  end

  private

  def periodicity_params
    params.require(:periodicity).permit(:name, :period)
  end
end
